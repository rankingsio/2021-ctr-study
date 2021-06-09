---
title: "CTR study"
author: "François Delavy and FrontPage Data for Rankings.io"
date: "Last update: 2021-06-09"
output:
  html_document:
    theme: paper
    highlight: kate
    # code_folding: hide
    toc: true
    toc_depth: 3
    toc_float: true
    number_sections: true
    keep_md: true # keep the intermediary files, including the plots as .png
editor_options:
  chunk_output_type: console
---


<style>
.list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
background-color: #D21D5C;
border-color: #D21D5C;
}

body {
font-family: 'Alegreya Sans', sans-serif;
color: #333333;
font-size: 16px;
}

h1 {
font-weight: bold;
font-size: 28px;
}

h1.title {
font-size: 30px;
color: #111111;
}

h2 {
font-size: 24px;
}

h3 {
font-size: 18px;
}
</style>




# Introduction 

In this study, we want to test for the effect of increasing [Click-Through Rates](https://support.google.com/google-ads/answer/2615875?hl=en) (CTRs) on Google Search rankings.  
We focus on a particular niche: car accident lawyers (personal injury lawyers). We “artificially” increase the number of visits to randomly selected car accident lawyers' websites with a service provider and measure the impact on the rankings.  

By “artificially” increasing the number of searches and visits per day, we improve the CTR and thus hypothesize that it will have a positive impact on the Google Search ranking. As background, ([see Larry Kim's post](https://moz.com/blog/does-organic-ctr-impact-seo-rankings-new-data)) for a captivating discussion of this issue.  

The goals of this project are:

1. To test if increasing the CTR does increase the ranking and measure the gain.
2. To test if using a provider of organic traffic to increase your SEO (by increasing your CTR), in the particular case of personal injury lawyers, is effective. 


# Methodology

## Overview

We register with [SERP Empire](https://www.serpempire.com), a current hype organic traffic provider. We launch a campaign for 60 selected personal injury lawyer's websites. Each campaign is "artificially" boosting the number of searches and clicks for the keyword “[_city_] car accident lawyer”. By doing so, we increase their CTR for a duration of 30 days. 

We collect the position (Google Search ranking) of the website every day from the SERP Empire interface. We then analyze the position of each website over the course of the study to assess the strength of the effect and effectiveness of using a traffic provider.  

One of the major caveat of this study is that we use SERP Empire both to boost the number of visits and to measure the effect of this boost. We rely on the Google Search ranking provided by SERP Empire to assess its own efficacy.    

Finally, it is worth noting that the ranking of any website is expected to vary over time. And this, for reasons that are not controllable by this study. We expect however, that we might see a general effect when looking at many websites. This is the reason why we collected 60 samples, from various cities and various starting ranking.   

## In More Details

### Websites Selection

We select 3 personal injury lawyers in 20 U.S. cities. We randomly picked one website appearing in the first page, second page and third page of the results of a Google search with the keywords “[_city_] car accident lawyer”. We use [Ahrefs Keyword Explorer](https://ahrefs.com/keywords-explorer) for this selection. We only select websites that appeared in the first to third page of the Google Search results (according to Ahrefs), because SERP Empire does only collects the results of the first 3 pages. In the end, we obtain a sample of 60 personal injury lawyer websites in various cities and with various Google Search positions. 

### Boosting Calibration

We want to give each website a comparable boost in visits, and a boost that looks organic. If we gave the same boost to the personal injury website ranking 2nd in a large city where there is a lot of competition, let's say LA, to the website ranking 28th in Fresno, we would run into two problems. First, the comparative size of the boost will be extremely different: insignificant for the top personal injury lawyer's website in LA, but oversized for the lower ranking website in Fresno. Second, the boost in Fresno will not look "organic" and would likely be detected by Google as not being _real_ organic traffic on the website and discarded.   

Therefore, we calibrate the boost in visits to an _estimated number of daily visits_ for each website. Here is how we do it: 

1. We multiply the _average number of daily searches_ in a city for the keywords “[_city_] car accident lawyer”, computed from the monthly volume on Google Ads, to the expected CTR of the website, computed from is Google search ranking (provided by Ahref) to a _ranking CTR factor_ (provided by the [Google Organic CTR History](https://www.advancedwebranking.com/ctrstudy/) of Advanced Web Ranking). This _ranking CTR factor_ provides an estimation of the CTR in function of the position in the Google Search results. Indeed, a website ranking first is much more likely to be visited than a website ranking lower. By doing so, we get the number of _estimated daily visits_.  

2. Then, we multiply the _estimated daily visits_ to a common _multiplier_, this is the "boost", to obtain the calibrated number of daily keywords searches that we will add to each website with SERP Empire.

In short, for each website:

1. $\text{Ranking CTR factor} * \text{Daily Searches for keyword in city} = \text{Estimated Daily Visits}$
2. $\text{Estimated Daily Visits} * Multiplier = \text{Daily Keyword Searches}$

Where:   

* $\text{Ranking CTR factor} = \text{current ranking} * \text{CTR estimate from Google Organic CTR History study}$.  
* ${Daily Searches for keyword in city}$ is computed from Google Ads monthly volume for the keyword "[_city_] car accident lawyer"
* $\text{CTR estimate from Google Organic CTR History study}$ is the obtained from the _Organic + Local Pack_ ([source](https://www.advancedwebranking.com/ctrstudy/)) and is:  

<table class=" lightable-classic" style='font-size: 10px; font-family: "Arial Narrow", "Source Sans Pro", sans-serif; width: auto !important; margin-left: auto; margin-right: auto;'>
 <thead>
  <tr>
   <th style="text-align:center;"> Google Search position </th>
   <th style="text-align:center;"> CTR </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 13.13% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 8.88% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 5.21% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 4.12% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;"> 1.83% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1.53% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 1.29% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 8 </td>
   <td style="text-align:center;"> 1.05% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 9 </td>
   <td style="text-align:center;"> 1.01% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 1.08% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 1.10% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 12 </td>
   <td style="text-align:center;"> 1.02% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 13 </td>
   <td style="text-align:center;"> 0.87% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 14 </td>
   <td style="text-align:center;"> 0.76% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 0.62% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 16 </td>
   <td style="text-align:center;"> 0.56% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 17 </td>
   <td style="text-align:center;"> 0.60% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 18 </td>
   <td style="text-align:center;"> 0.48% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 0.44% </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 20 - 30 </td>
   <td style="text-align:center;"> 0.25% </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>

* The $Multiplier$ is the how much we multiply the $\text{Estimated Daily Visits}$: 30.  

This is the study plan:  

<table class=" lightable-classic" style='font-size: 10px; font-family: "Arial Narrow", "Source Sans Pro", sans-serif; width: auto !important; margin-left: auto; margin-right: auto;'>
 <thead>
  <tr>
   <th style="text-align:center;"> Sample </th>
   <th style="text-align:center;"> City </th>
   <th style="text-align:center;"> Keyword </th>
   <th style="text-align:center;"> Baseline City Daily Searches for the Keyword </th>
   <th style="text-align:center;"> Ahref ranking </th>
   <th style="text-align:center;"> Ranking CTR Factor </th>
   <th style="text-align:center;"> Estimated Daily Clicks </th>
   <th style="text-align:center;"> Multiplier </th>
   <th style="text-align:center;"> Number of Daily Searchs on SERP Empire </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> San Antonio </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> San Antonio car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 24 </td>
   <td style="text-align:center;"> 8 </td>
   <td style="text-align:center;"> 0.0105 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.25 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> San Antonio </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> San Antonio car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 24 </td>
   <td style="text-align:center;"> 13 </td>
   <td style="text-align:center;"> 0.0087 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.21 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> San Antonio </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> San Antonio car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 24 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.06 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Los Angeles </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Los Angeles car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 147 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 0.0412 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 6.04 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 181 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Los Angeles </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Los Angeles car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 147 </td>
   <td style="text-align:center;"> 13 </td>
   <td style="text-align:center;"> 0.0087 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1.28 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 38 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Los Angeles </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Los Angeles car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 147 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.37 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Brooklyn </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Brooklyn car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;"> 0.0183 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.61 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 18 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 8 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Brooklyn </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Brooklyn car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 13 </td>
   <td style="text-align:center;"> 0.0087 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.29 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 9 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Brooklyn </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Brooklyn car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.08 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Miami </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Miami car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 63 </td>
   <td style="text-align:center;"> 9 </td>
   <td style="text-align:center;"> 0.0101 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.64 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 19 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Miami </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Miami car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 63 </td>
   <td style="text-align:center;"> 12 </td>
   <td style="text-align:center;"> 0.0102 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.65 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 19 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 12 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Miami </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Miami car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 63 </td>
   <td style="text-align:center;"> 29 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.16 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 13 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Houston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Houston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 180 </td>
   <td style="text-align:center;"> 9 </td>
   <td style="text-align:center;"> 0.0101 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1.82 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 55 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 14 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Houston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Houston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 180 </td>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 0.0110 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1.98 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 59 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Houston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Houston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 180 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.45 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 14 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 16 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Chicago </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Chicago car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 43 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 0.0521 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 2.26 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 68 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 17 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Chicago </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Chicago car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 43 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 0.0062 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.27 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 18 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Chicago </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Chicago car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 43 </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.11 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Dallas </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Dallas car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 43 </td>
   <td style="text-align:center;"> 8 </td>
   <td style="text-align:center;"> 0.0105 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.46 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 14 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Dallas </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Dallas car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 43 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.11 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Dallas </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Dallas car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 43 </td>
   <td style="text-align:center;"> 28 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.11 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Minneapolis </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Minneapolis car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 120 </td>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;"> 0.0183 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 2.20 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 66 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Minneapolis </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Minneapolis car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 120 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 0.0062 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.74 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 22 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 24 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Minneapolis </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Minneapolis car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 120 </td>
   <td style="text-align:center;"> 25 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 25 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Las Vegas </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Las Vegas car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 63 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 0.0412 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 2.61 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 78 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Las Vegas </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Las Vegas car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 63 </td>
   <td style="text-align:center;"> 16 </td>
   <td style="text-align:center;"> 0.0056 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.35 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Las Vegas </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Las Vegas car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 63 </td>
   <td style="text-align:center;"> 29 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.16 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 28 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Orlando </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Orlando car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 20 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 0.0888 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1.75 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 52 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 29 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Orlando </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Orlando car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 20 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.05 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Orlando </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Orlando car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 20 </td>
   <td style="text-align:center;"> 30 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.05 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 31 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Tampa </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Tampa car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 9 </td>
   <td style="text-align:center;"> 0.0101 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.34 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 32 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Tampa </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Tampa car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 0.0062 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.21 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 33 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Tampa </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Tampa car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.08 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Kansas City </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Kansas City car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
   <td style="text-align:center;"> 8 </td>
   <td style="text-align:center;"> 0.0105 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.11 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 35 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Kansas City </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Kansas City car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
   <td style="text-align:center;"> 18 </td>
   <td style="text-align:center;"> 0.0048 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.05 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 36 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Kansas City </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Kansas City car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
   <td style="text-align:center;"> 25 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.03 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Austin </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Austin car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 0.0521 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1.74 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 52 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 38 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Austin </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Austin car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 16 </td>
   <td style="text-align:center;"> 0.0056 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.19 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 39 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Austin </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Austin car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 25 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.08 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 40 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Nashville </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Nashville car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 0.0129 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.14 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 41 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Nashville </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Nashville car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 0.0062 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.07 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 42 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Nashville </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Nashville car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
   <td style="text-align:center;"> 24 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.03 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 43 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Baltimore </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Baltimore car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 24 </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 0.0129 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.31 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 44 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Baltimore </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Baltimore car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 24 </td>
   <td style="text-align:center;"> 18 </td>
   <td style="text-align:center;"> 0.0048 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.12 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 45 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Baltimore </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Baltimore car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 24 </td>
   <td style="text-align:center;"> 29 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.06 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 46 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Queens </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Queens car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 7 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 0.0521 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.36 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 47 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Queens </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Queens car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 7 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 0.0062 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.04 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 48 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Queens </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Queens car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 7 </td>
   <td style="text-align:center;"> 24 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.02 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 49 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Fresno </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Fresno car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 16 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 0.0153 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.24 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 50 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Fresno </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Fresno car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 16 </td>
   <td style="text-align:center;"> 14 </td>
   <td style="text-align:center;"> 0.0076 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.12 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 51 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Fresno </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Fresno car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 16 </td>
   <td style="text-align:center;"> 25 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.04 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 52 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Charleston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Charleston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 5 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 0.0412 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.19 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 53 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Charleston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Charleston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 5 </td>
   <td style="text-align:center;"> 13 </td>
   <td style="text-align:center;"> 0.0087 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.04 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 54 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Charleston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Charleston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 5 </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.01 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 55 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Denver </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Denver car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 9 </td>
   <td style="text-align:center;"> 0.0101 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.34 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 56 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Denver </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Denver car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 12 </td>
   <td style="text-align:center;"> 0.0102 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.34 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 57 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Denver </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Denver car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 33 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.08 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 58 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Boston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Boston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 16 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 0.0108 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.17 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 59 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Boston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Boston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 16 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 0.0062 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.10 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 60 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Boston </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> Boston car accident lawyer </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 16 </td>
   <td style="text-align:center;"> 29 </td>
   <td style="text-align:center;"> 0.0025 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 0.04 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 30 </td>
   <td style="text-align:center;background-color: #FAFAFA !important;"> 1 </td>
  </tr>
</tbody>
</table>

How to read the study plan, for instance for the first personal injury lawyer in San Antonio: We multiply the baseline number of daily searches in San Antonio for the keyword to the CTR, which depend onn the ranking, to obtain the _estimated number of daily click_ for the sample 1. We multiply this number by our multiplier to obtain the number of visits that we will pay SERP Empire to do on this website everyday.  

### SERP Empire Parameters

We use the traffic provider SERP Empire to visits our 60 sampled websites the number of day indicated in the column _Number of Daily Searchs on SERP Empire_ on the study plan above. To make the traffic look more organic, SERP Empire bots will vary their exact number of visits around this average.  

In addition, we use the following SERP Empire parameters:  

* The country and region are specified
* 50% of mobile searches
* 2 pages per session
* Average session duration: 60 seconds
* Bounce Rate: 50%

We boost the daily visits of the websites for 1 month.  


### Data Collection and Quality

From the SERP Empire dashboard, we manually collect the rank of each 60 website everyday.  

A few comment on the data quality:   

* Sample number 6 is removed from the analysis as the website could not be found by SERP Empire anymore for the majoritty of the study (from 2021-03-14).  
* There are a few websites who could not easily be found by SERP Empire, and needed to be modified. Thus, there are a few missing days at the beginning of the month for some samples.   
* The initial ranking obtained from Ahrefs and that determined the CTR ranking factor is sometimes a bit different that the ranking on SERP Empire, which is to be expected. Nevertheless it is quite similar (it explains for instance why some websites ranked above the position 30).  
* We boost the visits for one keyword only: "[_city_] car accident lawyer”



# Research Findings 

## Rankinng Over Time

We start by visualizing the evolution of the rank of the 60 websites. Each line represent the ranking of a personal injury lawyer's website for the keyword "car accident lawyer" over time. The pink line is a loess regression with standard error and represent a smoothed average, similar to a moving average.  


```{=html}
<div id="htmlwidget-f946377fa885a930832f" style="width:80%;height:480px;" class="girafe html-widget"></div>
<script type="application/json" data-for="htmlwidget-f946377fa885a930832f">{"x":{"html":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef' viewBox='0 0 432.00 360.00'>\n  <g>\n    <defs>\n      <clipPath id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_1'>\n        <rect x='0.00' y='0.00' width='432.00' height='360.00'/>\n      <\/clipPath>\n    <\/defs>\n    <rect x='0.00' y='0.00' width='432.00' height='360.00' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_1' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_1)' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='0.75' stroke-linejoin='round' stroke-linecap='round'/>\n    <defs>\n      <clipPath id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_2'>\n        <rect x='0.00' y='0.00' width='432.00' height='360.00'/>\n      <\/clipPath>\n    <\/defs>\n    <rect x='-0.00' y='0.00' width='432.00' height='360.00' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_2' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_2)' fill='#FFFFFF' fill-opacity='1' stroke='#FFFFFF' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='round'/>\n    <defs>\n      <clipPath id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3'>\n        <rect x='56.98' y='74.17' width='345.13' height='230.39'/>\n      <\/clipPath>\n    <\/defs>\n    <polyline points='108.09,304.56 108.09,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_3' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='178.94,304.56 178.94,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_4' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='249.79,304.56 249.79,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_5' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='320.64,304.56 320.64,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_6' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='371.24,304.56 371.24,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_7' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,84.64 402.11,84.64' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_8' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,110.03 402.11,110.03' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_9' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,141.76 402.11,141.76' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_10' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,173.50 402.11,173.50' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_11' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,205.23 402.11,205.23' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_12' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,236.97 402.11,236.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_13' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,268.70 402.11,268.70' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_14' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='72.67,304.56 72.67,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_15' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='143.52,304.56 143.52,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_16' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='143.52,304.56 143.52,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_17' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='214.36,304.56 214.36,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_18' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='285.21,304.56 285.21,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_19' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='356.06,304.56 356.06,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_20' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='386.42,304.56 386.42,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_21' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#EAEAEA' stroke-opacity='1' stroke-width='0.85' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='72.67,122.72 82.79,148.11 92.91,135.42 103.03,141.76 113.15,141.76 123.27,154.46 133.39,135.42 143.52,122.72 153.64,122.72 163.76,116.38 173.88,154.46 184.00,173.50 194.12,173.50 204.24,167.15 214.36,141.76 224.48,148.11 234.61,148.11 244.73,148.11 254.85,148.11 264.97,135.42 275.09,148.11 285.21,148.11 295.33,148.11 305.45,148.11 315.58,141.76 325.70,135.42 335.82,141.76 345.94,141.76 356.06,141.76 366.18,141.76 376.30,141.76 386.42,141.76' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_22' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 1, San Antonio' title='Sample 1, San Antonio'/>\n    <polyline points='72.67,160.81 82.79,160.81 92.91,167.15 103.03,160.81 113.15,173.50 123.27,154.46 133.39,167.15 143.52,173.50 153.64,173.50 163.76,173.50 173.88,160.81 184.00,167.15 194.12,167.15 204.24,167.15 214.36,154.46 224.48,141.76 234.61,141.76 244.73,135.42 254.85,141.76 264.97,141.76 275.09,141.76 285.21,141.76 295.33,141.76 305.45,141.76 315.58,148.11 325.70,148.11 335.82,148.11 345.94,148.11 356.06,141.76 366.18,148.11 376.30,148.11 386.42,148.11' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_23' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 2, San Antonio' title='Sample 2, San Antonio'/>\n    <polyline points='103.03,243.32 113.15,243.32 123.27,243.32 133.39,243.32 143.52,243.32 153.64,224.27 163.76,224.27 173.88,217.93 184.00,230.62 194.12,230.62 204.24,249.66 214.36,224.27 224.48,224.27 234.61,224.27 244.73,224.27 254.85,217.93 264.97,224.27 275.09,224.27 285.21,224.27 295.33,230.62 305.45,224.27 315.58,230.62 325.70,230.62 335.82,230.62 345.94,230.62 356.06,224.27 366.18,224.27 376.30,224.27 386.42,224.27' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_24' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 3, San Antonio' title='Sample 3, San Antonio'/>\n    <polyline points='72.67,116.38 82.79,110.03 92.91,110.03 103.03,110.03 113.15,110.03 123.27,110.03 133.39,103.68 143.52,103.68 153.64,103.68 163.76,103.68 173.88,122.72 184.00,129.07 194.12,135.42 204.24,129.07 214.36,116.38 224.48,116.38 234.61,116.38 244.73,116.38 254.85,116.38 264.97,116.38 275.09,116.38 285.21,116.38 295.33,116.38 305.45,116.38 315.58,116.38 325.70,116.38 335.82,116.38 345.94,116.38 356.06,116.38 366.18,116.38 376.30,116.38 386.42,116.38' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_25' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 4, Los Angeles' title='Sample 4, Los Angeles'/>\n    <polyline points='72.67,167.15 82.79,173.50 92.91,186.19 103.03,186.19 113.15,186.19 123.27,186.19 133.39,186.19 143.52,179.85 153.64,186.19 163.76,192.54 173.88,192.54 184.00,192.54 194.12,205.23 204.24,198.89 214.36,179.85 224.48,186.19 234.61,186.19 244.73,179.85 254.85,186.19 264.97,179.85 275.09,186.19 285.21,186.19 295.33,186.19 305.45,198.89 315.58,198.89 325.70,211.58 335.82,211.58 345.94,236.97 356.06,243.32 366.18,243.32 376.30,243.32 386.42,243.32' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_26' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 5, Los Angeles' title='Sample 5, Los Angeles'/>\n    <polyline points='72.67,129.07 82.79,129.07 92.91,129.07 103.03,129.07 113.15,129.07 123.27,129.07 133.39,129.07 143.52,129.07 153.64,129.07 163.76,129.07 173.88,129.07 184.00,135.42 194.12,129.07 204.24,129.07 214.36,129.07 224.48,129.07 234.61,129.07 244.73,129.07 254.85,129.07 264.97,129.07 275.09,129.07 285.21,129.07 295.33,129.07 305.45,129.07 315.58,129.07 325.70,129.07 335.82,129.07 345.94,129.07 356.06,129.07 366.18,129.07 376.30,129.07 386.42,129.07' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_27' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 7, Brooklyn' title='Sample 7, Brooklyn'/>\n    <polyline points='72.67,97.34 82.79,110.03 92.91,122.72 103.03,122.72 113.15,122.72 123.27,122.72 133.39,148.11 143.52,122.72 153.64,116.38 163.76,110.03 173.88,103.68 184.00,90.99 194.12,84.64 204.24,84.64 214.36,90.99 224.48,84.64 234.61,84.64 244.73,84.64 254.85,84.64 264.97,84.64 275.09,84.64 285.21,84.64 295.33,84.64 305.45,84.64 315.58,84.64 325.70,84.64 335.82,84.64 345.94,84.64 356.06,90.99 366.18,90.99 376.30,84.64 386.42,84.64' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_28' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 8, Brooklyn' title='Sample 8, Brooklyn'/>\n    <polyline points='92.91,243.32 103.03,243.32 113.15,243.32 123.27,268.70 133.39,268.70 143.52,268.70 153.64,268.70 163.76,262.36 173.88,262.36 184.00,211.58 194.12,224.27 204.24,224.27 214.36,224.27 224.48,217.93 234.61,217.93 244.73,217.93 254.85,211.58 264.97,211.58 275.09,211.58 285.21,211.58 295.33,217.93 305.45,224.27 315.58,224.27 325.70,217.93 335.82,217.93 345.94,217.93 356.06,217.93 366.18,217.93 376.30,217.93 386.42,217.93' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_29' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 9, Brooklyn' title='Sample 9, Brooklyn'/>\n    <polyline points='72.67,154.46 82.79,154.46 92.91,154.46 103.03,154.46 113.15,160.81 123.27,154.46 133.39,148.11 143.52,148.11 153.64,154.46 163.76,148.11 173.88,154.46 184.00,160.81 194.12,167.15 204.24,167.15 214.36,148.11 224.48,141.76 234.61,141.76 244.73,141.76 254.85,141.76 264.97,141.76 275.09,141.76 285.21,129.07 295.33,135.42 305.45,129.07 315.58,122.72 325.70,129.07 335.82,129.07 345.94,129.07 356.06,129.07 366.18,129.07 376.30,129.07 386.42,129.07' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_30' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 10, Miami' title='Sample 10, Miami'/>\n    <polyline points='72.67,173.50 82.79,179.85 92.91,179.85 103.03,192.54 113.15,173.50 123.27,173.50 133.39,160.81 143.52,173.50 153.64,167.15 163.76,167.15 173.88,186.19 184.00,205.23 194.12,211.58 204.24,205.23 214.36,179.85 224.48,186.19 234.61,179.85 244.73,173.50 254.85,179.85 264.97,205.23 275.09,192.54 285.21,186.19 295.33,192.54 305.45,256.01 315.58,224.27 325.70,211.58 335.82,198.89 345.94,205.23 356.06,205.23 366.18,217.93 376.30,224.27 386.42,224.27' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_31' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 11, Miami' title='Sample 11, Miami'/>\n    <polyline points='72.67,262.36 82.79,262.36 92.91,256.01 103.03,268.70 113.15,268.70 123.27,262.36 133.39,262.36 143.52,262.36 153.64,262.36 163.76,262.36 173.88,287.74 184.00,287.74 194.12,287.74 204.24,287.74 214.36,262.36 224.48,268.70 234.61,268.70 244.73,262.36 254.85,262.36 264.97,268.70 275.09,268.70 285.21,268.70 295.33,262.36 305.45,262.36 315.58,268.70 325.70,256.01 335.82,256.01 345.94,256.01 356.06,262.36 366.18,268.70 376.30,268.70 386.42,268.70' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_32' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 12, Miami' title='Sample 12, Miami'/>\n    <polyline points='72.67,148.11 82.79,148.11 92.91,135.42 103.03,141.76 113.15,135.42 123.27,141.76 133.39,141.76 143.52,141.76 153.64,148.11 163.76,154.46 173.88,148.11 184.00,148.11 194.12,154.46 204.24,154.46 214.36,129.07 224.48,122.72 234.61,122.72 244.73,122.72 254.85,122.72 264.97,122.72 275.09,122.72 285.21,122.72 295.33,122.72 305.45,129.07 315.58,122.72 325.70,129.07 335.82,129.07 345.94,129.07 356.06,135.42 366.18,129.07 376.30,129.07 386.42,129.07' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_33' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 13, Houston' title='Sample 13, Houston'/>\n    <polyline points='72.67,198.89 82.79,186.19 92.91,192.54 103.03,192.54 113.15,198.89 123.27,198.89 133.39,198.89 143.52,198.89 153.64,205.23 163.76,211.58 173.88,211.58 184.00,217.93 194.12,224.27 204.24,224.27 214.36,198.89 224.48,192.54 234.61,192.54 244.73,192.54 254.85,198.89 264.97,205.23 275.09,198.89 285.21,192.54 295.33,198.89 305.45,192.54 315.58,186.19 325.70,186.19 335.82,186.19 345.94,186.19 356.06,186.19 366.18,192.54 376.30,186.19 386.42,192.54' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_34' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 14, Houston' title='Sample 14, Houston'/>\n    <polyline points='72.67,211.58 82.79,211.58 92.91,205.23 103.03,217.93 113.15,192.54 123.27,211.58 133.39,224.27 143.52,224.27 153.64,211.58 163.76,186.19 173.88,186.19 184.00,186.19 194.12,198.89 204.24,198.89 214.36,179.85 224.48,179.85 234.61,179.85 244.73,186.19 254.85,186.19 264.97,186.19 275.09,198.89 285.21,205.23 295.33,198.89 305.45,198.89 315.58,217.93 325.70,224.27 335.82,217.93 345.94,217.93 356.06,217.93 366.18,217.93 376.30,211.58 386.42,211.58' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_35' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 15, Houston' title='Sample 15, Houston'/>\n    <polyline points='72.67,129.07 82.79,129.07 92.91,116.38 103.03,110.03 113.15,97.34 123.27,90.99 133.39,90.99 143.52,90.99 153.64,97.34 163.76,97.34 173.88,103.68 184.00,103.68 194.12,110.03 204.24,122.72 214.36,103.68 224.48,103.68 234.61,103.68 244.73,97.34 254.85,97.34 264.97,97.34 275.09,97.34 285.21,103.68 295.33,97.34 305.45,97.34 315.58,103.68 325.70,110.03 335.82,110.03 345.94,110.03 356.06,103.68 366.18,103.68 376.30,103.68 386.42,103.68' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_36' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 16, Chicago' title='Sample 16, Chicago'/>\n    <polyline points='72.67,198.89 82.79,192.54 92.91,192.54 103.03,173.50 113.15,198.89 123.27,167.15 133.39,179.85 143.52,167.15 153.64,154.46 163.76,148.11 173.88,148.11 184.00,160.81 194.12,160.81 204.24,160.81 214.36,154.46 224.48,154.46 234.61,154.46 244.73,173.50 254.85,167.15 264.97,160.81 275.09,160.81 285.21,160.81 295.33,154.46 305.45,160.81 315.58,160.81 325.70,160.81 335.82,160.81 345.94,167.15 356.06,167.15 366.18,154.46 376.30,160.81 386.42,160.81' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_37' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 17, Chicago' title='Sample 17, Chicago'/>\n    <polyline points='82.79,205.23 92.91,230.62 103.03,224.27 113.15,224.27 123.27,224.27 133.39,224.27 143.52,236.97 153.64,243.32 163.76,243.32 173.88,217.93 184.00,217.93 194.12,217.93 204.24,224.27 214.36,224.27 224.48,186.19 234.61,192.54 244.73,192.54 254.85,192.54 264.97,192.54 275.09,192.54 285.21,192.54 295.33,192.54 305.45,192.54 315.58,192.54 325.70,192.54 335.82,192.54 345.94,192.54 356.06,192.54 366.18,192.54 376.30,192.54 386.42,192.54' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_38' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 18, Chicago' title='Sample 18, Chicago'/>\n    <polyline points='72.67,148.11 82.79,148.11 92.91,135.42 103.03,154.46 113.15,148.11 123.27,154.46 133.39,148.11 143.52,141.76 153.64,148.11 163.76,160.81 173.88,135.42 184.00,135.42 194.12,148.11 204.24,148.11 214.36,122.72 224.48,122.72 234.61,122.72 244.73,116.38 254.85,116.38 264.97,116.38 275.09,116.38 285.21,116.38 295.33,129.07 305.45,122.72 315.58,129.07 325.70,129.07 335.82,129.07 345.94,129.07 356.06,129.07 366.18,129.07 376.30,129.07 386.42,129.07' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_39' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 19, Dallas' title='Sample 19, Dallas'/>\n    <polyline points='72.67,224.27 82.79,211.58 92.91,217.93 103.03,205.23 113.15,205.23 123.27,217.93 133.39,211.58 143.52,217.93 153.64,217.93 163.76,205.23 173.88,179.85 184.00,217.93 194.12,205.23 204.24,205.23 214.36,179.85 224.48,192.54 234.61,211.58 244.73,211.58 254.85,211.58 264.97,217.93 275.09,211.58 285.21,205.23 295.33,173.50 305.45,205.23 315.58,224.27 325.70,224.27 335.82,224.27 345.94,217.93 356.06,224.27 366.18,205.23 376.30,217.93 386.42,217.93' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_40' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 20, Dallas' title='Sample 20, Dallas'/>\n    <polyline points='72.67,179.85 82.79,186.19 92.91,179.85 103.03,192.54 113.15,192.54 123.27,173.50 133.39,173.50 143.52,198.89 153.64,198.89 163.76,198.89 173.88,173.50 184.00,173.50 194.12,205.23 204.24,211.58 214.36,186.19 224.48,179.85 234.61,160.81 244.73,160.81 254.85,160.81 264.97,179.85 275.09,179.85 285.21,179.85 295.33,179.85 305.45,179.85 315.58,179.85 325.70,179.85 335.82,179.85 345.94,179.85 356.06,173.50 366.18,179.85 376.30,179.85 386.42,179.85' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_41' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 21, Dallas' title='Sample 21, Dallas'/>\n    <polyline points='72.67,110.03 82.79,116.38 92.91,122.72 103.03,122.72 113.15,122.72 123.27,110.03 133.39,110.03 143.52,103.68 153.64,103.68 163.76,110.03 173.88,103.68 184.00,110.03 194.12,110.03 204.24,110.03 214.36,103.68 224.48,97.34 234.61,103.68 244.73,103.68 254.85,103.68 264.97,110.03 275.09,103.68 285.21,103.68 295.33,103.68 305.45,103.68 315.58,103.68 325.70,103.68 335.82,103.68 345.94,103.68 356.06,103.68 366.18,103.68 376.30,103.68 386.42,122.72' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_42' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 22, Minneapolis' title='Sample 22, Minneapolis'/>\n    <polyline points='72.67,186.19 82.79,192.54 92.91,192.54 103.03,192.54 113.15,198.89 123.27,192.54 133.39,186.19 143.52,186.19 153.64,186.19 163.76,173.50 173.88,173.50 184.00,192.54 194.12,211.58 204.24,198.89 214.36,173.50 224.48,179.85 234.61,173.50 244.73,173.50 254.85,173.50 264.97,173.50 275.09,173.50 285.21,167.15 295.33,167.15 305.45,167.15 315.58,167.15 325.70,167.15 335.82,167.15 345.94,167.15 356.06,167.15 366.18,167.15 376.30,167.15 386.42,167.15' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_43' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 23, Minneapolis' title='Sample 23, Minneapolis'/>\n    <polyline points='72.67,256.01 82.79,287.74 92.91,268.70 103.03,294.09 113.15,294.09 123.27,268.70 133.39,281.40 143.52,268.70 153.64,287.74 163.76,262.36 173.88,275.05 184.00,281.40 194.12,281.40 204.24,281.40 214.36,262.36 224.48,256.01 234.61,262.36 244.73,256.01 254.85,256.01 264.97,249.66 275.09,243.32 285.21,249.66 295.33,249.66 305.45,243.32 315.58,243.32 325.70,243.32 335.82,243.32 345.94,243.32 356.06,249.66 366.18,243.32 376.30,243.32 386.42,243.32' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_44' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 24, Minneapolis' title='Sample 24, Minneapolis'/>\n    <polyline points='72.67,103.68 82.79,103.68 92.91,97.34 103.03,97.34 113.15,97.34 123.27,97.34 133.39,97.34 143.52,97.34 153.64,103.68 163.76,116.38 173.88,135.42 184.00,141.76 194.12,148.11 204.24,148.11 214.36,129.07 224.48,122.72 234.61,122.72 244.73,122.72 254.85,129.07 264.97,129.07 275.09,122.72 285.21,122.72 295.33,122.72 305.45,122.72 315.58,129.07 325.70,129.07 335.82,129.07 345.94,129.07 356.06,116.38 366.18,110.03 376.30,110.03 386.42,110.03' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_45' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 25, Las Vegas' title='Sample 25, Las Vegas'/>\n    <polyline points='72.67,224.27 82.79,236.97 92.91,236.97 103.03,224.27 113.15,211.58 123.27,217.93 133.39,230.62 143.52,198.89 153.64,217.93 163.76,217.93 173.88,211.58 184.00,217.93 194.12,230.62 204.24,236.97 214.36,256.01 224.48,211.58 234.61,198.89 244.73,249.66 254.85,256.01 264.97,243.32 275.09,249.66 285.21,249.66 295.33,243.32 305.45,230.62 315.58,243.32 325.70,236.97 335.82,256.01 345.94,256.01 356.06,256.01 366.18,262.36 376.30,160.81 386.42,160.81' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_46' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 26, Las Vegas' title='Sample 26, Las Vegas'/>\n    <polyline points='92.91,262.36 103.03,256.01 113.15,256.01 123.27,268.70 133.39,211.58 143.52,262.36 153.64,256.01 163.76,256.01 173.88,230.62 184.00,236.97 194.12,224.27 204.24,236.97 214.36,211.58 224.48,205.23 234.61,205.23 244.73,230.62 254.85,211.58 264.97,211.58 275.09,217.93 285.21,211.58 295.33,211.58 305.45,211.58 315.58,211.58 325.70,211.58 335.82,205.23 345.94,205.23 356.06,198.89 366.18,198.89 376.30,205.23 386.42,205.23' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_47' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 27, Las Vegas' title='Sample 27, Las Vegas'/>\n    <polyline points='72.67,97.34 82.79,103.68 92.91,103.68 103.03,103.68 113.15,110.03 123.27,110.03 133.39,110.03 143.52,97.34 153.64,103.68 163.76,103.68 173.88,97.34 184.00,103.68 194.12,103.68 204.24,103.68 214.36,97.34 224.48,90.99 234.61,90.99 244.73,90.99 254.85,90.99 264.97,90.99 275.09,90.99 285.21,90.99 295.33,90.99 305.45,90.99 315.58,90.99 325.70,90.99 335.82,90.99 345.94,90.99 356.06,90.99 366.18,90.99 376.30,90.99 386.42,90.99' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_48' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 28, Orlando' title='Sample 28, Orlando'/>\n    <polyline points='92.91,224.27 103.03,224.27 113.15,224.27 123.27,230.62 133.39,236.97 143.52,236.97 153.64,236.97 163.76,243.32 173.88,211.58 184.00,230.62 194.12,230.62 204.24,230.62 214.36,230.62 224.48,230.62 234.61,230.62 244.73,211.58 254.85,211.58 264.97,211.58 275.09,211.58 285.21,211.58 295.33,211.58 305.45,211.58 315.58,205.23 325.70,198.89 335.82,198.89 345.94,198.89 356.06,192.54 366.18,198.89 376.30,198.89 386.42,198.89' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_49' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 29, Orlando' title='Sample 29, Orlando'/>\n    <polyline points='72.67,211.58 82.79,192.54 92.91,224.27 103.03,224.27 113.15,224.27 123.27,192.54 133.39,192.54 143.52,211.58 153.64,211.58 163.76,211.58 173.88,211.58 184.00,198.89 194.12,192.54 204.24,192.54 214.36,154.46 224.48,154.46 234.61,148.11 244.73,141.76 254.85,141.76 264.97,141.76 275.09,141.76 285.21,141.76 295.33,167.15 305.45,179.85 315.58,179.85 325.70,179.85 335.82,179.85 345.94,211.58 356.06,211.58 366.18,217.93 376.30,217.93 386.42,217.93' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_50' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 30, Orlando' title='Sample 30, Orlando'/>\n    <polyline points='72.67,141.76 82.79,141.76 92.91,129.07 103.03,122.72 113.15,129.07 123.27,122.72 133.39,110.03 143.52,122.72 153.64,116.38 163.76,97.34 173.88,97.34 184.00,97.34 194.12,97.34 204.24,97.34 214.36,97.34 224.48,97.34 234.61,90.99 244.73,97.34 254.85,90.99 264.97,90.99 275.09,97.34 285.21,97.34 295.33,97.34 305.45,97.34 315.58,97.34 325.70,103.68 335.82,103.68 345.94,97.34 356.06,90.99 366.18,97.34 376.30,90.99 386.42,90.99' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_51' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 31, Tampa' title='Sample 31, Tampa'/>\n    <polyline points='72.67,167.15 82.79,179.85 92.91,179.85 103.03,179.85 113.15,186.19 123.27,192.54 133.39,167.15 143.52,173.50 153.64,173.50 163.76,192.54 173.88,154.46 184.00,173.50 194.12,186.19 204.24,205.23 214.36,173.50 224.48,173.50 234.61,173.50 244.73,173.50 254.85,173.50 264.97,173.50 275.09,173.50 285.21,173.50 295.33,173.50 305.45,186.19 315.58,173.50 325.70,173.50 335.82,173.50 345.94,173.50 356.06,173.50 366.18,179.85 376.30,173.50 386.42,173.50' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_52' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 32, Tampa' title='Sample 32, Tampa'/>\n    <polyline points='92.91,236.97 103.03,262.36 113.15,262.36 123.27,230.62 133.39,230.62 143.52,243.32 153.64,243.32 163.76,243.32 173.88,243.32 184.00,243.32 194.12,243.32 204.24,243.32 214.36,230.62 224.48,236.97 234.61,211.58 244.73,211.58 254.85,211.58 264.97,217.93 275.09,217.93 285.21,211.58 295.33,205.23 305.45,205.23 315.58,205.23 325.70,211.58 335.82,211.58 345.94,205.23 356.06,205.23 366.18,205.23 376.30,211.58 386.42,211.58' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_53' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 33, Tampa' title='Sample 33, Tampa'/>\n    <polyline points='72.67,154.46 82.79,116.38 92.91,154.46 103.03,116.38 113.15,141.76 123.27,129.07 133.39,129.07 143.52,135.42 153.64,135.42 163.76,141.76 173.88,154.46 184.00,154.46 194.12,154.46 204.24,154.46 214.36,129.07 224.48,129.07 234.61,129.07 244.73,129.07 254.85,129.07 264.97,129.07 275.09,129.07 285.21,141.76 295.33,141.76 305.45,141.76 315.58,141.76 325.70,148.11 335.82,141.76 345.94,141.76 356.06,141.76 366.18,135.42 376.30,148.11 386.42,148.11' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_54' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 34, Kansas City' title='Sample 34, Kansas City'/>\n    <polyline points='123.27,236.97 133.39,249.66 143.52,230.62 153.64,230.62 163.76,230.62 173.88,236.97 184.00,236.97 194.12,236.97 204.24,236.97 214.36,236.97 224.48,236.97 234.61,211.58 244.73,217.93 254.85,262.36 264.97,256.01 275.09,217.93 285.21,262.36 295.33,256.01 305.45,256.01 315.58,262.36 325.70,262.36 335.82,236.97 345.94,236.97 356.06,236.97 366.18,256.01 376.30,249.66 386.42,249.66' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_55' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 35, Kansas City' title='Sample 35, Kansas City'/>\n    <polyline points='82.79,281.40 92.91,249.66 103.03,249.66 113.15,294.09 123.27,256.01 133.39,294.09 143.52,281.40 153.64,275.05 163.76,268.70 173.88,268.70 184.00,268.70 194.12,268.70 204.24,268.70 214.36,268.70 224.48,268.70 234.61,268.70 244.73,268.70 254.85,268.70 264.97,268.70 275.09,268.70 285.21,243.32 295.33,243.32 305.45,243.32 315.58,243.32 325.70,243.32 335.82,236.97 345.94,236.97 356.06,243.32 366.18,243.32 376.30,243.32 386.42,243.32' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_56' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 36, Kansas City' title='Sample 36, Kansas City'/>\n    <polyline points='72.67,90.99 82.79,90.99 92.91,90.99 103.03,90.99 113.15,97.34 123.27,97.34 133.39,122.72 143.52,122.72 153.64,122.72 163.76,129.07 173.88,129.07 184.00,135.42 194.12,141.76 204.24,135.42 214.36,116.38 224.48,110.03 234.61,110.03 244.73,110.03 254.85,110.03 264.97,110.03 275.09,110.03 285.21,110.03 295.33,110.03 305.45,110.03 315.58,116.38 325.70,116.38 335.82,116.38 345.94,116.38 356.06,110.03 366.18,116.38 376.30,116.38 386.42,116.38' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_57' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 37, Austin' title='Sample 37, Austin'/>\n    <polyline points='72.67,198.89 82.79,198.89 92.91,154.46 103.03,154.46 113.15,160.81 123.27,173.50 133.39,173.50 143.52,179.85 153.64,179.85 163.76,186.19 173.88,160.81 184.00,179.85 194.12,186.19 204.24,186.19 214.36,173.50 224.48,179.85 234.61,179.85 244.73,179.85 254.85,173.50 264.97,173.50 275.09,173.50 285.21,179.85 295.33,179.85 305.45,179.85 315.58,179.85 325.70,179.85 335.82,179.85 345.94,173.50 356.06,179.85 366.18,179.85 376.30,186.19 386.42,186.19' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_58' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 38, Austin' title='Sample 38, Austin'/>\n    <polyline points='82.79,192.54 92.91,224.27 103.03,224.27 113.15,224.27 123.27,224.27 133.39,217.93 143.52,217.93 153.64,211.58 163.76,211.58 173.88,224.27 184.00,198.89 194.12,198.89 204.24,211.58 214.36,211.58 224.48,211.58 234.61,211.58 244.73,192.54 254.85,192.54 264.97,192.54 275.09,186.19 285.21,192.54 295.33,192.54 305.45,198.89 315.58,186.19 325.70,192.54 335.82,192.54 345.94,192.54 356.06,192.54 366.18,192.54 376.30,192.54 386.42,192.54' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_59' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 39, Austin' title='Sample 39, Austin'/>\n    <polyline points='103.03,160.81 113.15,160.81 123.27,160.81 133.39,141.76 143.52,160.81 153.64,135.42 163.76,141.76 173.88,135.42 184.00,135.42 194.12,148.11 204.24,148.11 214.36,135.42 224.48,129.07 234.61,122.72 244.73,129.07 254.85,129.07 264.97,129.07 275.09,129.07 285.21,129.07 295.33,129.07 305.45,129.07 315.58,129.07 325.70,122.72 335.82,122.72 345.94,129.07 356.06,122.72 366.18,122.72 376.30,122.72 386.42,129.07' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_60' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 40, Nashville' title='Sample 40, Nashville'/>\n    <polyline points='72.67,179.85 82.79,173.50 92.91,173.50 103.03,236.97 113.15,236.97 123.27,236.97 133.39,236.97 143.52,236.97 153.64,236.97 163.76,236.97 173.88,217.93 184.00,186.19 194.12,211.58 204.24,211.58 214.36,186.19 224.48,186.19 234.61,186.19 244.73,160.81 254.85,160.81 264.97,160.81 275.09,160.81 285.21,160.81 295.33,160.81 305.45,160.81 315.58,154.46 325.70,154.46 335.82,167.15 345.94,192.54 356.06,192.54 366.18,192.54 376.30,192.54 386.42,192.54' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_61' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 41, Nashville' title='Sample 41, Nashville'/>\n    <polyline points='82.79,268.70 92.91,268.70 103.03,236.97 113.15,236.97 123.27,230.62 133.39,256.01 143.52,243.32 153.64,217.93 163.76,217.93 173.88,230.62 184.00,230.62 194.12,249.66 204.24,249.66 214.36,249.66 224.48,205.23 234.61,205.23 244.73,205.23 254.85,205.23 264.97,205.23 275.09,205.23 285.21,205.23 295.33,205.23 305.45,205.23 315.58,205.23 325.70,224.27 335.82,236.97 345.94,230.62 356.06,230.62 366.18,230.62 376.30,230.62 386.42,230.62' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_62' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 42, Nashville' title='Sample 42, Nashville'/>\n    <polyline points='72.67,122.72 82.79,110.03 92.91,103.68 103.03,97.34 113.15,97.34 123.27,97.34 133.39,103.68 143.52,110.03 153.64,103.68 163.76,97.34 173.88,103.68 184.00,103.68 194.12,103.68 204.24,103.68 214.36,103.68 224.48,103.68 234.61,103.68 244.73,110.03 254.85,110.03 264.97,103.68 275.09,103.68 285.21,103.68 295.33,103.68 305.45,110.03 315.58,110.03 325.70,103.68 335.82,110.03 345.94,110.03 356.06,110.03 366.18,103.68 376.30,110.03 386.42,103.68' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_63' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 43, Baltimore' title='Sample 43, Baltimore'/>\n    <polyline points='72.67,268.70 82.79,268.70 92.91,268.70 103.03,268.70 113.15,294.09 123.27,294.09 133.39,294.09 143.52,275.05 153.64,275.05 163.76,275.05 173.88,243.32 184.00,249.66 194.12,249.66 204.24,281.40 214.36,256.01 224.48,256.01 234.61,256.01 244.73,256.01 254.85,249.66 264.97,249.66 275.09,243.32 285.21,236.97 295.33,249.66 305.45,249.66 315.58,249.66 325.70,249.66 335.82,256.01 345.94,256.01 356.06,268.70 366.18,268.70 376.30,268.70 386.42,262.36' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_64' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 44, Baltimore' title='Sample 44, Baltimore'/>\n    <polyline points='72.67,249.66 82.79,230.62 92.91,224.27 103.03,256.01 113.15,256.01 123.27,224.27 133.39,224.27 143.52,256.01 153.64,256.01 163.76,262.36 173.88,249.66 184.00,268.70 194.12,268.70 204.24,268.70 214.36,256.01 224.48,243.32 234.61,243.32 244.73,236.97 254.85,236.97 264.97,224.27 275.09,236.97 285.21,236.97 295.33,230.62 305.45,230.62 315.58,236.97 325.70,236.97 335.82,236.97 345.94,236.97 356.06,249.66 366.18,243.32 376.30,243.32 386.42,243.32' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_65' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 45, Baltimore' title='Sample 45, Baltimore'/>\n    <polyline points='72.67,135.42 82.79,129.07 92.91,110.03 103.03,129.07 113.15,129.07 123.27,97.34 133.39,103.68 143.52,116.38 153.64,103.68 163.76,116.38 173.88,129.07 184.00,103.68 194.12,116.38 204.24,110.03 214.36,103.68 224.48,116.38 234.61,122.72 244.73,116.38 254.85,116.38 264.97,116.38 275.09,110.03 285.21,122.72 295.33,116.38 305.45,116.38 315.58,116.38 325.70,116.38 335.82,116.38 345.94,122.72 356.06,110.03 366.18,122.72 376.30,110.03 386.42,103.68' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_66' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 46, Queens' title='Sample 46, Queens'/>\n    <polyline points='82.79,179.85 92.91,179.85 103.03,192.54 113.15,192.54 123.27,198.89 133.39,198.89 143.52,167.15 153.64,148.11 163.76,141.76 173.88,141.76 184.00,173.50 194.12,173.50 204.24,173.50 214.36,154.46 224.48,154.46 234.61,167.15 244.73,173.50 254.85,167.15 264.97,167.15 275.09,173.50 285.21,173.50 295.33,173.50 305.45,173.50 315.58,167.15 325.70,167.15 335.82,160.81 345.94,160.81 356.06,148.11 366.18,148.11 376.30,148.11 386.42,148.11' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_67' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 47, Queens' title='Sample 47, Queens'/>\n    <polyline points='72.67,173.50 82.79,167.15 92.91,167.15 103.03,173.50 113.15,167.15 123.27,179.85 133.39,179.85 143.52,192.54 153.64,186.19 163.76,205.23 173.88,192.54 184.00,192.54 194.12,192.54 204.24,205.23 214.36,116.38 224.48,116.38 234.61,116.38 244.73,122.72 254.85,116.38 264.97,129.07 275.09,116.38 285.21,122.72 295.33,129.07 305.45,129.07 315.58,122.72 325.70,129.07 335.82,129.07 345.94,129.07 356.06,179.85 366.18,179.85 376.30,173.50 386.42,173.50' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_68' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 48, Queens' title='Sample 48, Queens'/>\n    <polyline points='72.67,129.07 82.79,129.07 92.91,122.72 103.03,122.72 113.15,116.38 123.27,129.07 133.39,135.42 143.52,135.42 153.64,141.76 163.76,148.11 173.88,141.76 184.00,160.81 194.12,160.81 204.24,160.81 214.36,135.42 224.48,135.42 234.61,135.42 244.73,135.42 254.85,135.42 264.97,129.07 275.09,135.42 285.21,135.42 295.33,135.42 305.45,122.72 315.58,103.68 325.70,103.68 335.82,103.68 345.94,103.68 356.06,103.68 366.18,103.68 376.30,103.68 386.42,110.03' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_69' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 49, Fresno' title='Sample 49, Fresno'/>\n    <polyline points='72.67,198.89 82.79,198.89 92.91,179.85 103.03,186.19 113.15,192.54 123.27,217.93 133.39,192.54 143.52,186.19 153.64,186.19 163.76,167.15 173.88,160.81 184.00,160.81 194.12,167.15 204.24,167.15 214.36,186.19 224.48,154.46 234.61,154.46 244.73,154.46 254.85,154.46 264.97,148.11 275.09,148.11 285.21,148.11 295.33,148.11 305.45,179.85 315.58,179.85 325.70,173.50 335.82,167.15 345.94,160.81 356.06,160.81 366.18,167.15 376.30,167.15 386.42,148.11' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_70' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 50, Fresno' title='Sample 50, Fresno'/>\n    <polyline points='92.91,275.05 103.03,275.05 113.15,275.05 123.27,275.05 133.39,275.05 143.52,262.36 153.64,262.36 163.76,249.66 173.88,249.66 184.00,249.66 194.12,281.40 204.24,281.40 214.36,262.36 224.48,249.66 234.61,249.66 244.73,249.66 254.85,256.01 264.97,256.01 275.09,256.01 285.21,256.01 295.33,256.01 305.45,256.01 315.58,256.01 325.70,256.01 335.82,256.01 345.94,262.36 356.06,262.36 366.18,262.36 376.30,262.36 386.42,262.36' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_71' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 51, Fresno' title='Sample 51, Fresno'/>\n    <polyline points='82.79,129.07 92.91,129.07 103.03,122.72 113.15,122.72 123.27,116.38 133.39,141.76 143.52,135.42 153.64,116.38 163.76,135.42 173.88,122.72 184.00,116.38 194.12,110.03 204.24,141.76 214.36,116.38 224.48,110.03 234.61,110.03 244.73,110.03 254.85,110.03 264.97,110.03 275.09,103.68 285.21,110.03 295.33,103.68 305.45,97.34 315.58,103.68 325.70,110.03 335.82,97.34 345.94,97.34 356.06,97.34 366.18,97.34 376.30,97.34 386.42,97.34' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_72' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 52, Charleston' title='Sample 52, Charleston'/>\n    <polyline points='72.67,186.19 82.79,179.85 92.91,192.54 103.03,192.54 113.15,186.19 123.27,186.19 133.39,186.19 143.52,294.09 153.64,294.09 163.76,294.09 173.88,256.01 184.00,256.01 194.12,256.01 204.24,249.66 214.36,262.36 224.48,256.01 234.61,256.01 244.73,256.01 254.85,256.01 264.97,256.01 275.09,256.01 285.21,256.01 295.33,256.01 305.45,160.81 315.58,154.46 325.70,154.46 335.82,154.46 345.94,154.46 356.06,236.97 366.18,230.62 376.30,230.62 386.42,230.62' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_73' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 53, Charleston' title='Sample 53, Charleston'/>\n    <polyline points='123.27,211.58 133.39,211.58 143.52,198.89 153.64,205.23 163.76,205.23 173.88,198.89 184.00,198.89 194.12,198.89 204.24,198.89 214.36,198.89 224.48,160.81 234.61,160.81 244.73,160.81 254.85,160.81 264.97,160.81 275.09,160.81 285.21,148.11 295.33,148.11 305.45,148.11 315.58,148.11 325.70,148.11 335.82,148.11 345.94,148.11 356.06,148.11 366.18,148.11 376.30,148.11 386.42,148.11' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_74' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 54, Charleston' title='Sample 54, Charleston'/>\n    <polyline points='72.67,148.11 82.79,154.46 92.91,141.76 103.03,148.11 113.15,160.81 123.27,148.11 133.39,154.46 143.52,141.76 153.64,141.76 163.76,135.42 173.88,141.76 184.00,154.46 194.12,160.81 204.24,160.81 214.36,135.42 224.48,135.42 234.61,135.42 244.73,135.42 254.85,135.42 264.97,135.42 275.09,135.42 285.21,135.42 295.33,135.42 305.45,135.42 315.58,135.42 325.70,135.42 335.82,135.42 345.94,135.42 356.06,135.42 366.18,135.42 376.30,135.42 386.42,135.42' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_75' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 55, Denver' title='Sample 55, Denver'/>\n    <polyline points='72.67,186.19 82.79,192.54 92.91,192.54 103.03,186.19 113.15,192.54 123.27,173.50 133.39,173.50 143.52,167.15 153.64,167.15 163.76,173.50 173.88,167.15 184.00,173.50 194.12,173.50 204.24,167.15 214.36,179.85 224.48,167.15 234.61,167.15 244.73,160.81 254.85,160.81 264.97,167.15 275.09,160.81 285.21,167.15 295.33,173.50 305.45,167.15 315.58,167.15 325.70,160.81 335.82,160.81 345.94,179.85 356.06,154.46 366.18,154.46 376.30,167.15 386.42,167.15' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_76' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 56, Denver' title='Sample 56, Denver'/>\n    <polyline points='82.79,236.97 92.91,236.97 103.03,236.97 113.15,236.97 123.27,243.32 133.39,243.32 143.52,243.32 153.64,243.32 163.76,236.97 173.88,236.97 184.00,236.97 194.12,243.32 204.24,262.36 214.36,262.36 224.48,224.27 234.61,217.93 244.73,217.93 254.85,211.58 264.97,211.58 275.09,224.27 285.21,236.97 295.33,236.97 305.45,236.97 315.58,224.27 325.70,230.62 335.82,236.97 345.94,236.97 356.06,236.97 366.18,236.97 376.30,249.66 386.42,256.01' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_77' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 57, Denver' title='Sample 57, Denver'/>\n    <polyline points='72.67,173.50 82.79,173.50 92.91,167.15 103.03,173.50 113.15,173.50 123.27,179.85 133.39,173.50 143.52,173.50 153.64,173.50 163.76,173.50 173.88,173.50 184.00,198.89 194.12,205.23 204.24,217.93 214.36,230.62 224.48,154.46 234.61,135.42 244.73,179.85 254.85,148.11 264.97,148.11 275.09,160.81 285.21,160.81 295.33,148.11 305.45,160.81 315.58,154.46 325.70,160.81 335.82,148.11 345.94,135.42 356.06,148.11 366.18,141.76 376.30,167.15 386.42,167.15' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_78' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 58, Boston' title='Sample 58, Boston'/>\n    <polyline points='82.79,160.81 92.91,148.11 103.03,198.89 113.15,167.15 123.27,167.15 133.39,160.81 143.52,173.50 153.64,173.50 163.76,160.81 173.88,198.89 184.00,154.46 194.12,154.46 204.24,154.46 214.36,154.46 224.48,141.76 234.61,141.76 244.73,141.76 254.85,154.46 264.97,141.76 275.09,141.76 285.21,141.76 295.33,192.54 305.45,167.15 315.58,179.85 325.70,167.15 335.82,160.81 345.94,167.15 356.06,167.15 366.18,167.15 376.30,167.15 386.42,167.15' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_79' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 59, Boston' title='Sample 59, Boston'/>\n    <polyline points='72.67,281.40 82.79,281.40 92.91,262.36 103.03,281.40 113.15,281.40 123.27,287.74 133.39,287.74 143.52,262.36 153.64,275.05 163.76,287.74 173.88,262.36 184.00,275.05 194.12,287.74 204.24,287.74 214.36,243.32 224.48,262.36 234.61,243.32 244.73,243.32 254.85,211.58 264.97,211.58 275.09,217.93 285.21,217.93 295.33,217.93 305.45,217.93 315.58,217.93 325.70,217.93 335.82,256.01 345.94,262.36 356.06,262.36 366.18,211.58 376.30,211.58 386.42,211.58' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_80' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt' data-id='Sample 60, Boston' title='Sample 60, Boston'/>\n    <polygon points='72.67,170.71 76.64,171.89 80.61,173.01 84.58,174.06 88.55,175.04 92.52,175.92 96.50,176.72 100.47,177.44 104.44,178.07 108.41,178.64 112.38,179.15 116.35,179.59 120.33,179.97 124.30,180.29 128.27,180.53 132.24,180.72 136.21,180.86 140.18,180.95 144.16,181.01 148.13,181.04 152.10,181.03 156.07,180.97 160.04,180.86 164.01,180.69 167.99,180.46 171.96,180.19 175.93,179.87 179.90,179.52 183.87,179.14 187.84,178.73 191.82,178.26 195.79,177.76 199.76,177.20 203.73,176.62 207.70,176.00 211.67,175.37 215.64,174.75 219.62,174.12 223.59,173.49 227.56,172.86 231.53,172.22 235.50,171.59 239.47,170.98 243.45,170.40 247.42,169.87 251.39,169.40 255.36,168.98 259.33,168.60 263.30,168.26 267.28,167.95 271.25,167.66 275.22,167.41 279.19,167.20 283.16,167.03 287.13,166.92 291.11,166.85 295.08,166.80 299.05,166.78 303.02,166.77 306.99,166.78 310.96,166.81 314.94,166.87 318.91,166.96 322.88,167.08 326.85,167.22 330.82,167.37 334.79,167.51 338.76,167.64 342.74,167.74 346.71,167.83 350.68,167.91 354.65,167.96 358.62,167.98 362.59,167.96 366.57,167.87 370.54,167.71 374.51,167.48 378.48,167.18 382.45,166.81 386.42,166.39 386.42,182.03 382.45,181.24 378.48,180.51 374.51,179.84 370.54,179.24 366.57,178.71 362.59,178.26 358.62,177.87 354.65,177.54 350.68,177.23 346.71,176.95 342.74,176.70 338.76,176.47 334.79,176.28 330.82,176.13 326.85,176.00 322.88,175.89 318.91,175.80 314.94,175.71 310.96,175.63 306.99,175.56 303.02,175.52 299.05,175.51 295.08,175.54 291.11,175.60 287.13,175.70 283.16,175.83 279.19,175.97 275.22,176.14 271.25,176.34 267.28,176.59 263.30,176.89 259.33,177.24 255.36,177.64 251.39,178.09 247.42,178.57 243.45,179.08 239.47,179.63 235.50,180.20 231.53,180.80 227.56,181.44 223.59,182.10 219.62,182.77 215.64,183.44 211.67,184.08 207.70,184.70 203.73,185.28 199.76,185.85 195.79,186.39 191.82,186.92 187.84,187.42 183.87,187.89 179.90,188.31 175.93,188.68 171.96,188.98 167.99,189.23 164.01,189.43 160.04,189.59 156.07,189.73 152.10,189.82 148.13,189.88 144.16,189.88 140.18,189.83 136.21,189.72 132.24,189.57 128.27,189.39 124.30,189.20 120.33,188.99 116.35,188.78 112.38,188.56 108.41,188.34 104.44,188.11 100.47,187.89 96.50,187.69 92.52,187.54 88.55,187.44 84.58,187.40 80.61,187.42 76.64,187.49 72.67,187.60' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_81' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='#999999' fill-opacity='0.4' stroke='none'/>\n    <polyline points='72.67,170.71 76.64,171.89 80.61,173.01 84.58,174.06 88.55,175.04 92.52,175.92 96.50,176.72 100.47,177.44 104.44,178.07 108.41,178.64 112.38,179.15 116.35,179.59 120.33,179.97 124.30,180.29 128.27,180.53 132.24,180.72 136.21,180.86 140.18,180.95 144.16,181.01 148.13,181.04 152.10,181.03 156.07,180.97 160.04,180.86 164.01,180.69 167.99,180.46 171.96,180.19 175.93,179.87 179.90,179.52 183.87,179.14 187.84,178.73 191.82,178.26 195.79,177.76 199.76,177.20 203.73,176.62 207.70,176.00 211.67,175.37 215.64,174.75 219.62,174.12 223.59,173.49 227.56,172.86 231.53,172.22 235.50,171.59 239.47,170.98 243.45,170.40 247.42,169.87 251.39,169.40 255.36,168.98 259.33,168.60 263.30,168.26 267.28,167.95 271.25,167.66 275.22,167.41 279.19,167.20 283.16,167.03 287.13,166.92 291.11,166.85 295.08,166.80 299.05,166.78 303.02,166.77 306.99,166.78 310.96,166.81 314.94,166.87 318.91,166.96 322.88,167.08 326.85,167.22 330.82,167.37 334.79,167.51 338.76,167.64 342.74,167.74 346.71,167.83 350.68,167.91 354.65,167.96 358.62,167.98 362.59,167.96 366.57,167.87 370.54,167.71 374.51,167.48 378.48,167.18 382.45,166.81 386.42,166.39' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_82' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='none'/>\n    <polyline points='386.42,182.03 382.45,181.24 378.48,180.51 374.51,179.84 370.54,179.24 366.57,178.71 362.59,178.26 358.62,177.87 354.65,177.54 350.68,177.23 346.71,176.95 342.74,176.70 338.76,176.47 334.79,176.28 330.82,176.13 326.85,176.00 322.88,175.89 318.91,175.80 314.94,175.71 310.96,175.63 306.99,175.56 303.02,175.52 299.05,175.51 295.08,175.54 291.11,175.60 287.13,175.70 283.16,175.83 279.19,175.97 275.22,176.14 271.25,176.34 267.28,176.59 263.30,176.89 259.33,177.24 255.36,177.64 251.39,178.09 247.42,178.57 243.45,179.08 239.47,179.63 235.50,180.20 231.53,180.80 227.56,181.44 223.59,182.10 219.62,182.77 215.64,183.44 211.67,184.08 207.70,184.70 203.73,185.28 199.76,185.85 195.79,186.39 191.82,186.92 187.84,187.42 183.87,187.89 179.90,188.31 175.93,188.68 171.96,188.98 167.99,189.23 164.01,189.43 160.04,189.59 156.07,189.73 152.10,189.82 148.13,189.88 144.16,189.88 140.18,189.83 136.21,189.72 132.24,189.57 128.27,189.39 124.30,189.20 120.33,188.99 116.35,188.78 112.38,188.56 108.41,188.34 104.44,188.11 100.47,187.89 96.50,187.69 92.52,187.54 88.55,187.44 84.58,187.40 80.61,187.42 76.64,187.49 72.67,187.60' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_83' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='none'/>\n    <polyline points='72.67,179.16 76.64,179.69 80.61,180.21 84.58,180.73 88.55,181.24 92.52,181.73 96.50,182.21 100.47,182.66 104.44,183.09 108.41,183.49 112.38,183.85 116.35,184.18 120.33,184.48 124.30,184.74 128.27,184.96 132.24,185.15 136.21,185.29 140.18,185.39 144.16,185.45 148.13,185.46 152.10,185.43 156.07,185.35 160.04,185.23 164.01,185.06 167.99,184.84 171.96,184.58 175.93,184.27 179.90,183.92 183.87,183.52 187.84,183.07 191.82,182.59 195.79,182.07 199.76,181.53 203.73,180.95 207.70,180.35 211.67,179.73 215.64,179.09 219.62,178.44 223.59,177.79 227.56,177.15 231.53,176.51 235.50,175.89 239.47,175.30 243.45,174.74 247.42,174.22 251.39,173.74 255.36,173.31 259.33,172.92 263.30,172.58 267.28,172.27 271.25,172.00 275.22,171.78 279.19,171.59 283.16,171.43 287.13,171.31 291.11,171.23 295.08,171.17 299.05,171.14 303.02,171.14 306.99,171.17 310.96,171.22 314.94,171.29 318.91,171.38 322.88,171.49 326.85,171.61 330.82,171.75 334.79,171.90 338.76,172.05 342.74,172.22 346.71,172.39 350.68,172.57 354.65,172.75 358.62,172.93 362.59,173.11 366.57,173.29 370.54,173.47 374.51,173.66 378.48,173.84 382.45,174.03 386.42,174.21' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_84' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_3)' fill='none' stroke='#D21D5C' stroke-opacity='1' stroke-width='2.13' stroke-linejoin='round' stroke-linecap='butt'/>\n    <defs>\n      <clipPath id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4'>\n        <rect x='0.00' y='0.00' width='432.00' height='360.00'/>\n      <\/clipPath>\n    <\/defs>\n    <polyline points='56.98,304.56 56.98,74.17' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_85' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.71' stroke-linejoin='round' stroke-linecap='butt'/>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='47.04' y='87.88' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_86' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>1<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='47.04' y='113.27' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_87' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>5<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='42.04' y='145.00' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_88' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>10<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='42.04' y='176.74' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_89' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>15<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='42.04' y='208.47' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_90' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>20<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='42.04' y='240.21' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_91' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>25<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='42.04' y='271.94' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_92' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>30<\/text>\n    <\/g>\n    <polyline points='54.24,84.64 56.98,84.64' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_93' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='54.24,110.03 56.98,110.03' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_94' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='54.24,141.76 56.98,141.76' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_95' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='54.24,173.50 56.98,173.50' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_96' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='54.24,205.23 56.98,205.23' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_97' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='54.24,236.97 56.98,236.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_98' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='54.24,268.70 56.98,268.70' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_99' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='56.98,304.56 402.11,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_100' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.71' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='72.67,307.30 72.67,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_101' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='143.52,307.30 143.52,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_102' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='143.52,307.30 143.52,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_103' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='214.36,307.30 214.36,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_104' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='285.21,307.30 285.21,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_105' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='356.06,307.30 356.06,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_106' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <polyline points='386.42,307.30 386.42,304.56' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_107' clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)' fill='none' stroke='#000000' stroke-opacity='1' stroke-width='1.07' stroke-linejoin='round' stroke-linecap='butt'/>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='58.41' y='315.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_108' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>05 Mar<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='129.26' y='315.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_109' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>12 Mar<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='129.26' y='315.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_110' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>12 Mar<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='200.11' y='315.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_111' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>19 Mar<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='270.95' y='315.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_112' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>26 Mar<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='342.06' y='315.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_113' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>02 Apr<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='372.42' y='315.97' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_114' font-size='6.75pt' font-weight='bold' font-family='Helvetica'>05 Apr<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='218.71' y='327.90' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_115' font-size='7.50pt' font-weight='bold' font-family='Helvetica'>Date<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text transform='translate(37.09,201.59) rotate(-90.00)' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_116' font-size='7.50pt' font-weight='bold' font-family='Helvetica'>Rank<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='29.89' y='55.68' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_117' font-size='7.50pt' font-family='Helvetica'>Ranking of all samples over time and a smoothed average (loess regression) in pink.<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='29.89' y='66.48' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_118' font-size='7.50pt' font-family='Helvetica'>Hover on a line to highlight the evolution of a particular website.<\/text>\n    <\/g>\n    <g clip-path='url(#svg_7323d81f-9999-472e-ad80-492dcdfb74ef_cl_4)'>\n      <text x='29.89' y='39.93' id='svg_7323d81f-9999-472e-ad80-492dcdfb74ef_el_119' font-size='10.50pt' font-family='Helvetica'>Ranking Over Time<\/text>\n    <\/g>\n  <\/g>\n<\/svg>","js":null,"uid":"svg_7323d81f-9999-472e-ad80-492dcdfb74ef","ratio":1.2,"settings":{"tooltip":{"css":".tooltip_SVGID_ { padding:5px;background:black;color:white;border-radius:2px 2px 2px 2px ; position:absolute;pointer-events:none;z-index:999;}\n","offx":10,"offy":0,"use_cursor_pos":true,"opacity":0.9,"usefill":false,"usestroke":false,"delay":{"over":200,"out":500}},"hover":{"css":".hover_SVGID_ { stroke-width:2; }\n","reactive":false},"hoverkey":{"css":".hover_key_SVGID_ { stroke:red; }\n","reactive":false},"hovertheme":{"css":".hover_theme_SVGID_ { fill:green; }\n","reactive":false},"hoverinv":{"css":".hover_inv_SVGID_ { opacity:0.1; }\n"},"zoom":{"min":1,"max":1},"capture":{"css":".selected_SVGID_ { fill:red;stroke:gray; }\n","type":"multiple","only_shiny":true,"selected":[]},"capturekey":{"css":".selected_key_SVGID_ { stroke:gray; }\n","type":"single","only_shiny":true,"selected":[]},"capturetheme":{"css":".selected_theme_SVGID_ { stroke:gray; }\n","type":"single","only_shiny":true,"selected":[]},"toolbar":{"position":"topright","saveaspng":true,"pngname":"diagram"},"sizing":{"rescale":true,"width":1}}},"evals":[],"jsHooks":[]}</script>
```

We observe the following: 

* There is variability in the ranking of the websites, which will blurry the picture.
* Some websites did see an increase in their ranking over the month, other a decrease.  
* The smoothed average is increasing slightly, but the effect of boosting the visits for one month for one keyword is not dramatic. It seems to be around +2 positions.
* Something seems to have happened at around 2 weeks in the study (around March 19th). There is a small jump in the ranking for many websites, forming a visible pattern. Also, it seems that the variance of the ranking is less and a bit more stabilized. Could 2 weeks be the time it has needed for the Google algorithm to capture and adjust to the boost in visits?   

## Comparing First Week to Last Week

As we saw previously that there is variability in the ranking, we will compute the improvement in the ranking by comparing the average rank in the first week of the study to the average rank in the last week of the study.  


# Annex



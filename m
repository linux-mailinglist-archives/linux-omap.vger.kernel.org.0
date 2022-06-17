Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5D954F100
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jun 2022 08:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234463AbiFQGZj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jun 2022 02:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiFQGZj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jun 2022 02:25:39 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D184B40B;
        Thu, 16 Jun 2022 23:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655447138; x=1686983138;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9jX8x1B0yyMxIR5oC5RaasA8RuJ4KOsyAyVIyowaP3U=;
  b=Dr+rNexBITT+LV2qVZ8tyb1DOL5ojTAn6eHpI1zy+3PUKv/3SgJs2387
   SvaZqs4QYXQyLEVu7PQKN49HNCcinMvZ95uSD0sdMGscJhpVQMkMTwPVJ
   VaChYboxD8r50Rywu3IhP6xRd16pGTEMgHTWh8kS3mWkj4Oqj16j+mj00
   a4NZOucUCl1WliNE6Z3GF3D+fyxD+L0Pwebl52P4Uri4PEVVqpQozaEzs
   RmoX26JAWymW0LErq+EeF8Y5mDc0CMb/ctI3hSInjQWAkRVukiyofBI1j
   QAkULj8Ve4mkKztGcXiYibQN5ZUYUTitpqhFxwi/Cltj9OE+ZQfL8i0PH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365784557"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="365784557"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 23:25:37 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="641906970"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.33.57])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 23:25:34 -0700
Message-ID: <173521c9-2e5c-8301-1dcf-b6f692866ef2@intel.com>
Date:   Fri, 17 Jun 2022 09:25:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] mmc: sdhci-omap: Fix a lockdep warning for PM runtime
 init
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20220617040300.30321-1-tony@atomide.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20220617040300.30321-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 17/06/22 07:03, Tony Lindgren wrote:
> We need hardware enabled early in probe to detect capabilities, but must
> not call sdhci_runtime_resume_host() until sdhci_setup_host() has been
> called. Let's check for an initialized controller like we already do
> for context restore.

Begs the question: why not prevent runtime pm until after sdhci_setup_host().
Maybe expand the commit message explanation a bit?

> 
> Fixes: f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/mmc/host/sdhci-omap.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1441,7 +1441,8 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
>  
> -	sdhci_runtime_suspend_host(host);
> +	if (omap_host->con != -EINVAL)
> +		sdhci_runtime_suspend_host(host);
>  
>  	sdhci_omap_context_save(omap_host);
>  
> @@ -1458,10 +1459,10 @@ static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
>  
>  	pinctrl_pm_select_default_state(dev);
>  
> -	if (omap_host->con != -EINVAL)
> +	if (omap_host->con != -EINVAL) {
>  		sdhci_omap_context_restore(omap_host);
> -
> -	sdhci_runtime_resume_host(host, 0);
> +		sdhci_runtime_resume_host(host, 0);
> +	}
>  
>  	return 0;
>  }


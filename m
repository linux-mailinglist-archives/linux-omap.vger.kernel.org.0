Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98817554480
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jun 2022 10:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbiFVHcm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jun 2022 03:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbiFVHcl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jun 2022 03:32:41 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12A136176;
        Wed, 22 Jun 2022 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655883160; x=1687419160;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5TkYKj47D80Y8CvmV9A/e+wMJcwk8DEvuRuN5bs4PHg=;
  b=fgHUc2cKgBzvlr1JtQFojE9hzKX6DPMw/J6aM3A0eMIzqESg9slfGBjY
   E/uuby7yUB/oqLyXO6pLZGPkt6d9Baa1GGc8vOgpZ4UbQYwnwf/+4oVSF
   +x+2JBD8Q46ptNtcuZ/e2/7/Ouuf3xFfhHtgmfEwxnf1nwmdAFQdb0hnP
   9UmmqVZWYQJjMnCW7kolkZIGXs37uVyjE4DhiN6qH/ePd7hsl31qNUAyq
   z3r0hkV2xdG6Q92aqBOHVy2W4lgyFgtGDb37kQM00vZQuQgJQqaYVIh3T
   GfNHCV55A+5Doar2kaFzKAp1fEMI5nbDOrOclN4FUh45T9lQQu0ANBCoe
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260772777"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="260772777"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 00:32:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="644049772"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.59.193])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 00:32:37 -0700
Message-ID: <8d905632-b9d6-9bc5-de5c-ac1093eb320b@intel.com>
Date:   Wed, 22 Jun 2022 10:32:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/1] mmc: sdhci-omap: Fix a lockdep warning for PM
 runtime init
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20220622051215.34063-1-tony@atomide.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20220622051215.34063-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/06/22 08:12, Tony Lindgren wrote:
> We need runtime PM enabled early in probe before sdhci_setup_host() for
> sdhci_omap_set_capabilities(). But on the first runtime resume we must
> not call sdhci_runtime_resume_host() as sdhci_setup_host() has not been
> called yet. Let's check for an initialized controller like we already do
> for context restore to fix a lockdep warning.
> 
> Fixes: f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> 
> Changes since v1:
> 
> - Add comments for why runtime PM is needed before sdhci_setup_host()
>   as suggested by Adrian
> 
> ---
>  drivers/mmc/host/sdhci-omap.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1298,8 +1298,9 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>  	/*
>  	 * omap_device_pm_domain has callbacks to enable the main
>  	 * functional clock, interface clock and also configure the
> -	 * SYSCONFIG register of omap devices. The callback will be invoked
> -	 * as part of pm_runtime_get_sync.
> +	 * SYSCONFIG register to clear any boot loader set voltage
> +	 * capabilities before calling sdhci_setup_host(). The
> +	 * callback will be invoked as part of pm_runtime_get_sync.
>  	 */
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 50);
> @@ -1441,7 +1442,8 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
>  
> -	sdhci_runtime_suspend_host(host);
> +	if (omap_host->con != -EINVAL)
> +		sdhci_runtime_suspend_host(host);
>  
>  	sdhci_omap_context_save(omap_host);
>  
> @@ -1458,10 +1460,10 @@ static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
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


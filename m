Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6EBD55D05C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244156AbiF1D7s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 23:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244143AbiF1D7r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 23:59:47 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A4A229803;
        Mon, 27 Jun 2022 20:59:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 70BC78106;
        Tue, 28 Jun 2022 03:54:34 +0000 (UTC)
Date:   Tue, 28 Jun 2022 06:59:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Liang He <windhl@126.com>
Cc:     andre.przywara@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm/mach: Hold reference returned by of_find_xxx APIs
Message-ID: <Yrp8sUMdmfYsiUsD@atomide.com>
References: <20220621091937.4082422-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621091937.4082422-1-windhl@126.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Liang He <windhl@126.com> [220621 12:14]:
> diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
> index 668dc84fd31e..a7368d657aa8 100644
> --- a/arch/arm/mach-omap2/pmic-cpcap.c
> +++ b/arch/arm/mach-omap2/pmic-cpcap.c
> @@ -238,8 +238,11 @@ static struct omap_voltdm_pmic omap4_fan_iva = {
>  int __init omap4_cpcap_init(void)
>  {
>  	struct voltagedomain *voltdm;
> +	struct device_node *np;
>  
> -	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
> +	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
> +	of_node_put(np);
> +	if (!np)
>  		return -ENODEV;

Hmm so here you are checking for !np after of_node_put()?

> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
> index 4e1ee70b2a3f..2aeac041bcb9 100644
> --- a/arch/arm/mach-tegra/irq.c
> +++ b/arch/arm/mach-tegra/irq.c
> @@ -88,7 +88,11 @@ static const struct of_device_id tegra_ictlr_match[] __initconst = {
>  
>  void __init tegra_init_irq(void)
>  {
> -	if (WARN_ON(!of_find_matching_node(NULL, tegra_ictlr_match)))
> +	struct device_node *np;
> +
> +	np = of_find_matching_node(NULL, tegra_ictlr_match);
> +	of_node_put(np);
> +	if (WARN_ON(!np))
>  		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
>  
>  	tegra114_gic_cpu_pm_registration();

Here too.

Regards,

Tony

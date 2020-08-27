Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41704254748
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 16:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgH0Oqz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 10:46:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:45686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728098AbgH0Oqx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Aug 2020 10:46:53 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7623922B4B;
        Thu, 27 Aug 2020 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598539612;
        bh=11kjkxrZ1KlShNO5tYEuJppL7eE0J4PVf6jQfEffwII=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=1w65j1kq6Nv6863YjmMUcNZtkuTPLRMzhsPYMSB++HKTCTGAaVVh8d+h5rMWPzAaC
         ZNnzplqBTYuSTr50a/GnsVGQhhFREL7ttXaDscBTcnfh/S7w5fz65siSCEChvZ5LQu
         Zo6sy8IVh2Q30SeJRFyFusukvtSqjYv8sfyyMsBs=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kBJAw-0079iW-Id; Thu, 27 Aug 2020 15:46:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 27 Aug 2020 15:46:50 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>, kernel-team@android.com
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
In-Reply-To: <20200727211008.24225-1-s-anna@ti.com>
References: <20200727211008.24225-1-s-anna@ti.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <0c1feaf91b9d285c1bded488437705da@misterjones.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: s-anna@ti.com, lee.jones@linaro.org, arnd@arndb.de, grzegorz.jaszczyk@linaro.org, david@lechnology.com, tony@atomide.com, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

On 2020-07-27 22:10, Suman Anna wrote:
> The DT node full name is currently being used in regmap_config
> which in turn is used to create the regmap debugfs directories.
> This name however is not guaranteed to be unique and the regmap
> debugfs registration can fail in the cases where the syscon nodes
> have the same unit-address but are present in different DT node
> hierarchies. Replace this logic using the syscon reg resource
> address instead (inspired from logic used while creating platform
> devices) to ensure a unique name is given for each syscon.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Arnd,
> Lee is looking for your review on this patch. Can you please
> review and provide your comments.
> 
> This is a resend of the patch that was posted previously, rebased
> now onto latest kernel.
> 
> v2: https://patchwork.kernel.org/patch/11353355/
>  - Fix build warning reported by kbuild test bot
> v1: https://patchwork.kernel.org/patch/11346363/
> 
>  drivers/mfd/syscon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 3a97816d0cba..75859e492984 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct
> device_node *np, bool check_clk)
>  		}
>  	}
> 
> -	syscon_config.name = of_node_full_name(np);
> +	syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
> +				       (u64)res.start);
>  	syscon_config.reg_stride = reg_io_width;
>  	syscon_config.val_bits = reg_io_width * 8;
>  	syscon_config.max_register = resource_size(&res) - reg_io_width;
> 
>  	regmap = regmap_init_mmio(NULL, base, &syscon_config);
> +	kfree(syscon_config.name);
>  	if (IS_ERR(regmap)) {
>  		pr_err("regmap init failed\n");
>  		ret = PTR_ERR(regmap);

This patch triggers some illegal memory accesses when debugfs is
enabled, as regmap does rely on config->name to be persistent
when the debugfs registration is deferred via regmap_debugfs_early_list
(__regmap_init() -> regmap_attach_dev() -> regmap_debugfs_init()...),
leading to a KASAN splat on demand.

I came up with the following patch that solves the issue for me.

Thanks,

         M.

 From fd3f5f2bf72df53be18d13914fe349a34f81f16b Mon Sep 17 00:00:00 2001
 From: Marc Zyngier <maz@kernel.org>
Date: Thu, 27 Aug 2020 14:45:34 +0100
Subject: [PATCH] mfd: syscon: Don't free allocated name for 
regmap_config

The name allocated for the regmap_config structure is freed
pretty early, right after the registration of the MMIO region.

Unfortunately, that doesn't follow the life cycle that debugfs
expects, as it can access the name field long after the free
has occured.

Move the free on the error path, and keep it forever otherwise.

Fixes: e15d7f2b81d2 ("mfd: syscon: Use a unique name with 
regmap_config")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
  drivers/mfd/syscon.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 75859e492984..7a660411c562 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -108,7 +108,6 @@ static struct syscon *of_syscon_register(struct 
device_node *np, bool check_clk)
  	syscon_config.max_register = resource_size(&res) - reg_io_width;

  	regmap = regmap_init_mmio(NULL, base, &syscon_config);
-	kfree(syscon_config.name);
  	if (IS_ERR(regmap)) {
  		pr_err("regmap init failed\n");
  		ret = PTR_ERR(regmap);
@@ -145,6 +144,7 @@ static struct syscon *of_syscon_register(struct 
device_node *np, bool check_clk)
  	regmap_exit(regmap);
  err_regmap:
  	iounmap(base);
+	kfree(syscon_config.name);
  err_map:
  	kfree(syscon);
  	return ERR_PTR(ret);
-- 
2.27.0


-- 
Jazz is not dead. It just smells funny...

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F51F1FB43B
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 16:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgFPO0c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 10:26:32 -0400
Received: from muru.com ([72.249.23.125]:57948 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgFPO0c (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Jun 2020 10:26:32 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 16BFA8123;
        Tue, 16 Jun 2020 14:27:22 +0000 (UTC)
Date:   Tue, 16 Jun 2020 07:26:28 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [RFC PATCH] pinctrl-single: parse #pinctrl-cells = 2
Message-ID: <20200616142628.GX37466@atomide.com>
References: <20200615230906.GA3967771@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615230906.GA3967771@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200615 23:10]:
> These changes are based on feedback from Tony [1] concerning changing
> pinctrl-single to be able to handle pinctrl-cells = 2 for for the 
> "pinctrl-single,pins" property.

Hey this is great! Thanks for sorting it out.

> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1017,11 +1017,21 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
>  			break;
>  		}
>  
> -		/* Index plus one value cell */
>  		offset = pinctrl_spec.args[0];
>  		vals[found].reg = pcs->base + offset;
> -		vals[found].val = pinctrl_spec.args[1];
>  
> +		pr_info("%s: args_count=%d offset=0x%x", __func__,
> +				pinctrl_spec.args_count, offset);
> +		pr_info("%s: args[1]=0x%x", __func__, pinctrl_spec.args[1]);
> +
> +		if (pinctrl_spec.args_count == 2) {
> +			vals[found].val = pinctrl_spec.args[1];
> +		} else if (pinctrl_spec.args_count == 3) {
> +			pr_info("%s: args[2]=0x%x", __func__, pinctrl_spec.args[2]);
> +			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
> +		}

Maybe do the above with a switch? And leave out the pr_info for the
final version :) Also please do a separate patch for pinctrl-singl.c,
and then another patch for the define and dts change.

Hmm so now the conf and mux values are still register masks in the dts
which is not ideal in all cases. But that's a separate issue and could
be sorted out as needed later on with adding separate conf and mux
shifts and masks. Not sure if we want to do that for the existing use
cases though.

Regards,

Tony

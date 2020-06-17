Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903071FD2E8
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jun 2020 18:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgFQQyP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jun 2020 12:54:15 -0400
Received: from muru.com ([72.249.23.125]:58120 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgFQQyP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Jun 2020 12:54:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9D14480F3;
        Wed, 17 Jun 2020 16:55:06 +0000 (UTC)
Date:   Wed, 17 Jun 2020 09:54:12 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [RFC PATCH] pinctrl-single: parse #pinctrl-cells = 2
Message-ID: <20200617165412.GG37466@atomide.com>
References: <20200615230906.GA3967771@x1>
 <20200616142628.GX37466@atomide.com>
 <20200616165314.GC4007093@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616165314.GC4007093@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200616 16:54]:
> By register masks, do you mean the #define's like PIN_OUTPUT_PULLDOWN
> and MUX_MODE6?
> 
> AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE6)
> 
> There is a possibility to also use the pinconf properties defined in
> pinctrl-single.c:
> 
> 	static const struct pcs_conf_type prop2[] = {
> 		{ "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
> 		{ "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
> 		{ "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
> 		{ "pinctrl-single,low-power-mode", PIN_CONFIG_LOW_POWER_MODE, },
> 	};
> 	static const struct pcs_conf_type prop4[] = {
> 		{ "pinctrl-single,bias-pullup", PIN_CONFIG_BIAS_PULL_UP, },
> 		{ "pinctrl-single,bias-pulldown", PIN_CONFIG_BIAS_PULL_DOWN, },
> 		{ "pinctrl-single,input-schmitt-enable",
> 			PIN_CONFIG_INPUT_SCHMITT_ENABLE, },
> 	};

Oh right I forgot about that :)

> I did some testing with pr_info's sprinkled in and I think those values
> are correct but I would be happy to hear from someone with more insight
> in the design of bias-pulldown and bias-pullup.

OK thanks for testing with the pinconf properties.

Regards,

Tony

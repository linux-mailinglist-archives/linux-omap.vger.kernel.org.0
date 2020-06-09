Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261D21F446D
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 20:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732806AbgFISEY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 14:04:24 -0400
Received: from muru.com ([72.249.23.125]:57484 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732473AbgFISEH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 9 Jun 2020 14:04:07 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6B2E78088;
        Tue,  9 Jun 2020 18:04:58 +0000 (UTC)
Date:   Tue, 9 Jun 2020 11:04:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200609180404.GR37466@atomide.com>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
 <20200527221915.GA2963339@x1>
 <20200527224108.GM37466@atomide.com>
 <20200528125323.GA3074222@x1>
 <20200529174037.GT37466@atomide.com>
 <20200608180543.GA2825296@x1>
 <20200608202218.GA2891935@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608202218.GA2891935@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200608 20:23]:
> I've been looking at pinctrl-single.c further and now I am wondering if
> it makes sense to modify pcs_parse_one_pinctrl_entry() or create a new
> function.  Currently it does:
> 
> 1020                 /* Index plus one value cell */
> 1021                 offset = pinctrl_spec.args[0];
> 1022                 vals[found].reg = pcs->base + offset;
> 1023                 vals[found].val = pinctrl_spec.args[1];
> 
> I believe it will need something similar to what is done in
> pcs_parse_bits_in_pinctrl_entry():
> 
> 1136                 /* Index plus two value cells */
> 1137                 offset = pinctrl_spec.args[0];
> 1138                 val = pinctrl_spec.args[1];
> 1139                 mask = pinctrl_spec.args[2];
> 
> So using #pinctrl-cells = <2> would require would require:
> 
> offset = pinctrl_spec.args[0];
> vals[found].reg = pcs->base + offset;
> vals[found].conf = pinctrl_spec.args[1];
> vals[found].mux = pinctrl_spec.args[2];
> 
> However, the type of vals:
> 
> struct pcs_func_vals {
> 	void __iomem *reg;
> 	unsigned val;
> 	unsigned mask;
> };
> 
> represents the combined mux + conf value in the register, so I think
> pcs_conf_vals would need to used:
> 
> struct pcs_conf_vals {
> 	enum pin_config_param param;
> 	unsigned val;
> 	unsigned enable;
> 	unsigned disable;
> 	unsigned mask;
> };
> 
> Thoughts?

Yes sounds about right to me. On write the driver would just write
the register based on mux and conf and orr the values together
using configured shifts.

Not sure if #pinctrl-cells would ever be more than 2 in this
case, but having things generic where possible makes sense.

For example, the omap padconf wakeirq specific bits could
potentially configured with #pinctrl-cells = <3>. We now
handle them automatically as interrupts so there's really
nothing to configure there.

I don't if other SoCs might need to configure other options
beyond conf and mux in the dts. I guess it's safe to assume
nothing else needs to be configured and have the folks needing
more support add it as needed.

Regards,

Tony

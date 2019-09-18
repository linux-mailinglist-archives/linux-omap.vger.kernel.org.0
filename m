Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E24B6E83
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 22:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731728AbfIRUxs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 16:53:48 -0400
Received: from muru.com ([72.249.23.125]:33750 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727814AbfIRUxs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 16:53:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CD55B806C;
        Wed, 18 Sep 2019 20:54:18 +0000 (UTC)
Date:   Wed, 18 Sep 2019 13:53:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name
 with reg-names
Message-ID: <20190918205344.GE5610@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com>
 <20190907035518.EB40C208C3@mail.kernel.org>
 <20190908194241.GL52127@atomide.com>
 <20190918180729.C2BB521907@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918180729.C2BB521907@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Stephen Boyd <sboyd@kernel.org> [190918 18:08]:
> Quoting Tony Lindgren (2019-09-08 12:42:41)
> > Or do you have some better ideas on how to name a clock controller
> > in the device tree?
> > 
> 
> Why does the name of the clock controller or clkdm_name matter? Using a
> string from reg-names smells like a workaround to describe some sort of
> linkage between things that isn't being described in DT today.

Correct. This problem will eventually disappear with genpd
handling the clockdomains.

But currently the clockdomain name is parsed from the dt node
name, which is not standard practise. Using reg-names
is a standard binding, and it's usage follows the standand
here to describe the reg range.

Then eventually with genpd, the reg-names will just become
optinoal. But until that happens the $subject patch fixes
issues as described in the patch.

Regards,

Tony

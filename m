Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2451443C200
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 07:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238167AbhJ0FFq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 01:05:46 -0400
Received: from muru.com ([72.249.23.125]:48920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230349AbhJ0FFq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 Oct 2021 01:05:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 968AB80CD;
        Wed, 27 Oct 2021 05:03:54 +0000 (UTC)
Date:   Wed, 27 Oct 2021 08:03:18 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCHv2] dt-bindings: bus: ti-sysc: Update to use yaml binding
Message-ID: <YXjdloMA02XtIGZ4@atomide.com>
References: <20211015113350.35830-1-tony@atomide.com>
 <YXh0JtEnB6uKR/my@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXh0JtEnB6uKR/my@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [211026 21:34]:
> I reworked the reg-names and clock-names to be more concise and applied. 

OK thanks.

> Like this:
> 
>   clock-names:
>     description:
>       Target module clock names like "fck", "ick", "optck1", "optck2"
>       if the clocks are configurable.
>     oneOf:
>       - enum: [ ick, fck, sys_clk ]
>       - items:
>           - const: fck
>           - enum: [ ick. dbclk, osc, sys_clk, dss_clk, ahclkx ]
...

Looks good to me :)

Tony

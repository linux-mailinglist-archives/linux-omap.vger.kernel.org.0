Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDBB392A45
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 11:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbhE0JK7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 05:10:59 -0400
Received: from muru.com ([72.249.23.125]:60950 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235475AbhE0JK6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 May 2021 05:10:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F289180A8;
        Thu, 27 May 2021 09:09:29 +0000 (UTC)
Date:   Thu, 27 May 2021 12:09:21 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Gowtham Tammana <g-tammana@ti.com>, Suman Anna <s-anna@ti.com>,
        bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nisanth Menon <nm@ti.com>
Subject: Re: [PATCH v3] ARM: dts: dra7: Fix duplicate USB4 target module node
Message-ID: <YK9hwV8DaC+d4OvV@atomide.com>
References: <20210526213035.15448-1-g-tammana@ti.com>
 <YK8ykeNA9AsjB89I@atomide.com>
 <bd903d6a-2894-fc39-e431-5dfed04a3604@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd903d6a-2894-fc39-e431-5dfed04a3604@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210527 09:03]:
> On 27/05/2021 08:48, Tony Lindgren wrote:
> > But let's keep the target-module@140000 here as it puts it in the right
> > location rather than directly on the ocp. Let's mark it with
> > status = "disabled" in dra7-l4.dtsi, and add a comment noting it's only
> > available on dra74x. So similar to what you had in your v1 patch, except
> > disabled.
> 
> My preference would be not to mix SoC variant specific modules in common module,
> and fix dra74x instead by placing usb4 node in proper place:
> 
> &l4_per3 {						/* 0x48800000 */
> 	segment@0 {	
> -->

Yeah that's even better, and leaves out status = "disabled".
Sounds good to me.

Regards,

Tony

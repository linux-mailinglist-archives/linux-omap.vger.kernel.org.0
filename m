Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D89CFEA2
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 18:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfJHQOU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 12:14:20 -0400
Received: from muru.com ([72.249.23.125]:36022 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbfJHQOU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 12:14:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DB4A48081;
        Tue,  8 Oct 2019 16:14:52 +0000 (UTC)
Date:   Tue, 8 Oct 2019 09:14:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Jeroen Hofstee <jhofstee@victronenergy.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Koen Kooi <koen@dominion.thruhere.net>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
Message-ID: <20191008161416.GG5610@atomide.com>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
 <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
 <436f1712-7dec-db40-d08f-1a3032af3596@victronenergy.com>
 <d85cd860-22a3-6142-7f2d-736a428d7a31@ti.com>
 <20191008142349.GE5610@atomide.com>
 <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f779973-1702-47eb-158f-7000770c435a@victronenergy.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jeroen Hofstee <jhofstee@victronenergy.com> [191008 16:03]:
> Hello Tony,
> 
> On 10/8/19 4:23 PM, Tony Lindgren wrote:
> > * Grygorii Strashko <grygorii.strashko@ti.com> [191003 02:32]:
> >> On 03/10/2019 11:16, Jeroen Hofstee wrote:
> >>> Furthermore 4.19 is fine, so there is no need to include it in stable
> >>> and have a note to make sure also other patches are required etc.
> >> Hence all above patches went in 5.1 it would be correct to mention only
> >> 6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode
> > Jeroen, can you please send an updated patch with the fixes
> > tag changed?
> >
> 
> For completeness, there is no "Fixes tag" as you mentioned.
> The commit only refers to another commit which introduces
> a problem.

Well please add the fixes tag, that way this will get
properly applied to earlier stable kernels too :)

Regards,

Tony



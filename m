Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2F142D741
	for <lists+linux-omap@lfdr.de>; Thu, 14 Oct 2021 12:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhJNKol (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Oct 2021 06:44:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhJNKok (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Oct 2021 06:44:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9106961029;
        Thu, 14 Oct 2021 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634208153;
        bh=YviziDSx60ArktrgOAhlwV2SAqrRsCl2B1mc5NJO4P8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=di94DloSyNwlRRiMUA7CC7C+s12KEw9SlDJzhtWQhLME7kzhD2f724oo4fBKDW2Hy
         42Yxf0piJPRO/LSk/2xZwqCs4LO8RTOuKbi01un5XcmksA9mW6MwXl89kNR9TsARRS
         BmR5MbXqKAgYUtzn+Dc030rlqQiuu6gg+pN4QpUJJMM4ypcxFvLbM2bxGDjXSXXhD8
         lMTqd4+Y76q1n5fpscoJbPawJTtEvcbCl9nAV45OrXLQ6d2qQCdYtVrBj9Dj89y8Wa
         CsTpP8yJlbCzpLiumVi4NPlvckh+rJ7i10MAVknbchpqSL9XgFmLsoy5kZZn35BgTp
         k4UGgBY4u3KQA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mayBu-0008Hd-W7; Thu, 14 Oct 2021 12:42:27 +0200
Date:   Thu, 14 Oct 2021 12:42:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Drew Fustini <dfustini@baylibre.com>
Cc:     Benoit Cousson <bcousson@baylibre.com>,
        Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x: Add rtc node as system-power-controller
Message-ID: <YWgJkkJ4LuAJhLmk@hovoldconsulting.com>
References: <20211012191311.879838-1-dfustini@baylibre.com>
 <YWaJfofs8QAtBnVu@hovoldconsulting.com>
 <20211013214103.GA10628@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013214103.GA10628@x1>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 13, 2021 at 02:41:03PM -0700, Drew Fustini wrote:
> On Wed, Oct 13, 2021 at 09:23:42AM +0200, Johan Hovold wrote:
> > On Tue, Oct 12, 2021 at 12:13:12PM -0700, Drew Fustini wrote:
> > > From: Keerthy <j-keerthy@ti.com>
> > > 
> > > PMIC_PWR_EN pin of RTC on am335x-evm, bone, and boneblack is connected to
> > > PMIC on board, so flag rtc node as system-power-controller to allow
> > > software to poweroff boards.
> > 
> > The "system-power-controller" property is already set in
> > bone-common.dtsi since
> > 
> > 	2876cc4a773c ("ARM: dts: Move most of am335x-boneblack.dts to am335x-boneblack-common.dtsi")
> > 
> > so this probably only affects am335x-evm and that should be reflected in
> > the commit message.
> > 
> > Also, should you now remove the property from boneblack-common? Or just
> > add it to am335x-evm instead?
> 
> Thank you for reviewing. Yes, I should improve the commit message as the
> BeagleBone Black is already covered for the rtc system-power-controller
> in am335x-boneblack-common.dtsi.  

So is sancloud-bbe apparently.

I only noticed because I added support to BeagleBone Black long ago so
unless there'd been a regression it should already be supported.

> I believe it would be ok to remove system-power-controller from 
> am335x-boneblack-common.dtsi and have it in am335x-bone-common.dtsi.
> 
> These are the files that include am335x-boneblack-common.dtsi:
> arch/arm/boot/dts/am335x-boneblack-wireless.dts
> arch/arm/boot/dts/am335x-boneblack.dts
> arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> arch/arm/boot/dts/am335x-sancloud-bbe.dts
> 
> But they all also include am335x-bone-common.dtsi.
> 
> However, I just noticed that am335x-evm.dts does not include either
> am335x-boneblack-common.dtsi or am335x-boneblack-common.dtsi. Thus
> rtc system-power-controller should be directly inserted into
> am335x-evm.dts.

Right.

> I considered just moving system-power-controller to the rtc node in
> am33xx-l4.dtsi but I don't think that would be correct as this would not
> be valid for all am33xx devices.
> 
> Does that seem correct to you?

No, that wouldn't be right.

You're more familiar with the different variants here, but unless all
flavours of Bone Black have the signal wired, it should probably be
pushed down into the dts files again.

Johan

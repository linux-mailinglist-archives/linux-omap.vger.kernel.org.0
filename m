Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1346B4157E6
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 07:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbhIWFnA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 01:43:00 -0400
Received: from muru.com ([72.249.23.125]:36368 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229890AbhIWFnA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Sep 2021 01:43:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F2B4180F0;
        Thu, 23 Sep 2021 05:41:56 +0000 (UTC)
Date:   Thu, 23 Sep 2021 08:41:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YUwThz8SAdjBD+cn@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
 <YUsAffFIHUi1ZxEY@atomide.com>
 <cbe53e9f-b407-d758-67bb-5fb65bddfc03@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe53e9f-b407-d758-67bb-5fb65bddfc03@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210922 17:22]:
> Better luck with this one but looks like idling cause "undefined
> instruction" crash. Cache/memory etc corruption perhaps? Serial console
> log attached.

Hmm. If you comment out the twl power node, does the omap3-beagle-ab4.dtb
boot normally for you? It should behave the same as current mainline then
with the omap3isp issue.

> I used the new omap3-beagle-ab4.dtb:

OK. So for your rev c2 board, does the new omap3-beagle.dtb boot and
work for you?

> I guess the timer change would be the fix and twl changes for normal
> development cycle?

Yeah. Especially if it makes things worse for omap3-beagle-ab4.dtb.

Regards,

Tony

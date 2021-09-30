Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0950341D3E0
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 09:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348483AbhI3HGQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 03:06:16 -0400
Received: from muru.com ([72.249.23.125]:38972 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348472AbhI3HGP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 03:06:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 624628050;
        Thu, 30 Sep 2021 07:05:02 +0000 (UTC)
Date:   Thu, 30 Sep 2021 10:04:31 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YVVhfyshT/tpsnwm@atomide.com>
References: <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
 <YUsAffFIHUi1ZxEY@atomide.com>
 <cbe53e9f-b407-d758-67bb-5fb65bddfc03@bitmer.com>
 <YUwThz8SAdjBD+cn@atomide.com>
 <93196bcd-836d-2432-9d1c-458904ba4f41@bitmer.com>
 <YU14FjzAMU0uUubW@atomide.com>
 <18a27933-e412-c1ed-a744-62cfbcd6a81b@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18a27933-e412-c1ed-a744-62cfbcd6a81b@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210925 14:56]:
> So yes, with your latest patch omap3-beagle-ab4.dtb behaves as unpatched
> omap3-beagle.dtb (boots but timer issues when omap3_isp not loaded).

OK great. So now we still need to figure out why rev c is not booting
without the quirks for the fix.

Regards,

Tony

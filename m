Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDC22626F6
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 08:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgIIGAP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 02:00:15 -0400
Received: from muru.com ([72.249.23.125]:44356 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgIIGAO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Sep 2020 02:00:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9F31E80DD;
        Wed,  9 Sep 2020 06:00:14 +0000 (UTC)
Date:   Wed, 9 Sep 2020 09:00:56 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCHv3 0/3] Lost key-up interrupt handling for omap4-keypad
Message-ID: <20200909060056.GC2747@atomide.com>
References: <20200318225727.29327-1-tony@atomide.com>
 <20200908085220.GA31790@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908085220.GA31790@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200908 08:52]:
> Hi!
> 
> > This series updates omap4-keypad to disable unused long interrupts, and
> > implements the missing parts for the lost key-up interrupt quirk as
> > described in the silicon errata pdf.
> 
> I do not see this in 5.9-rc4; problem is real, could we get this
> merged?

Sorry for the slow going here. FYI, I'm still seeing stuck keys few times
a day though. It seems to be with the last entered key now though.

Regards,

Tony

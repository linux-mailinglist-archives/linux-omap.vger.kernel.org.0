Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3121CC22E
	for <lists+linux-omap@lfdr.de>; Sat,  9 May 2020 16:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgEIObO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 May 2020 10:31:14 -0400
Received: from muru.com ([72.249.23.125]:53706 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727105AbgEIObO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 9 May 2020 10:31:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 45F28809C;
        Sat,  9 May 2020 14:32:03 +0000 (UTC)
Date:   Sat, 9 May 2020 07:31:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: ofono for d4: less hcked and more working version was Re: USB
 networking news, ofono for d4: less hacked version
Message-ID: <20200509143111.GC37466@atomide.com>
References: <20200506101125.GA7490@amd>
 <20200506144338.GT37466@atomide.com>
 <20200506230525.GA22354@amd>
 <20200507140732.GU37466@atomide.com>
 <20200508100211.GA19646@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508100211.GA19646@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200508 10:03]:
> I pushed new version of ofono: I'm still not sure about those incoming
> sms (but _some_ sms are received). Rest should be better.

Please check that you have applied commit 738b150ecefb ("ARM: dts:
omap4-droid4: Fix occasional lost wakeirq for uart1"), otherwise incoming
SMS may not always show up, and GPS can stop producing data.

Hmm for ofono motchat, why not handle the U0000 part directly in motchat
and use just a timestamp based ID there?

Regards,

Tony

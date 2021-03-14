Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B902B33A70B
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 17:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhCNQ4K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 12:56:10 -0400
Received: from muru.com ([72.249.23.125]:43164 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233966AbhCNQ4I (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 12:56:08 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 66EB380B4;
        Sun, 14 Mar 2021 16:56:56 +0000 (UTC)
Date:   Sun, 14 Mar 2021 18:56:05 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Mighty M <mightymb17@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Display not working on omap4430
Message-ID: <YE5AJTZDAa5FahKz@atomide.com>
References: <CACLAQJGnXvd2Pk_BWH9n2ZZdWNC0FeTDwvHZ91wAJ=rTMQHc5w@mail.gmail.com>
 <CACLAQJFhwu_r4BuG4TscCV+FkF_cSG0RONNJW+_OwKP4_LOhPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACLAQJFhwu_r4BuG4TscCV+FkF_cSG0RONNJW+_OwKP4_LOhPg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mighty M <mightymb17@gmail.com> [210312 11:32]:
> The full dmesg https://pastebin.ubuntu.com/p/KdBZyHzS7t/ i am running 5.11 rc3.
> 
> On Thu, Mar 11, 2021 at 6:22 PM Mighty M <mightymb17@gmail.com> wrote:
> >
> > I have been working on Samsung Galaxy Tab 2 mainline, it uses omap4430
> > processor. But the display doesnt seem to be working, backlight is
> > fine but the screen is blank. Here is the dmesg
> > https://pastebin.ubuntu.com/p/SY9kdPY9Rd/. The error seems to be clk
> > mismatch, but i have no clue on how to fix it. Regards

Not sure why that happens, but looks like I've fixed some of the warnings
you're seeing recently. At least the rcu and smartreflex splats have been
fixed in my fixes branch, so you may want to pick some of those to make
your dmesg more readable.

Regards,

Tony

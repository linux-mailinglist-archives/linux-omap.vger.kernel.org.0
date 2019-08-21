Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89F897805
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 13:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfHULiC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 07:38:02 -0400
Received: from muru.com ([72.249.23.125]:58376 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfHULiC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 21 Aug 2019 07:38:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 42484809C;
        Wed, 21 Aug 2019 11:38:31 +0000 (UTC)
Date:   Wed, 21 Aug 2019 04:37:59 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: wl1271 broken on am3517-evm on for-next
Message-ID: <20190821113759.GO52127@atomide.com>
References: <CAHCN7xKmQmGBig0k+gwdMax8ojoR+B3aowDOu1FyiNM3gvypKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKmQmGBig0k+gwdMax8ojoR+B3aowDOu1FyiNM3gvypKg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190821 00:06]:
> Tony,
> 
> I noticed the AM3517-evm gets a bunch of splat when loading the wlcore
> and 80211 stuff.  It appears to be limited to your for-next branch.  I
> haven not bisected it, but before I did, I wanted to see if you were
> aware of anything.  If not, I'll work on bisecting it.  I just didn't
> want to waste time if you had any ideas first.

Hmm not sure why anything in my for-next would affect am3517? Maybe
something is broken in v5.3-rc1 that my for-next is based on.

Also, please test (again) with level wlcore interrupt instead of
edge. We recent gpio-omap fixes it's starting to look that we can
still have edge interrupts lost in retention idle with no status
to be seen in the gpio controller. So anything that can be treated
as level interrupt probaby should be.

Regards,

Tony

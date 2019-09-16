Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCE4FB3DE4
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 17:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731218AbfIPPp5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 11:45:57 -0400
Received: from muru.com ([72.249.23.125]:33248 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731014AbfIPPp5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Sep 2019 11:45:57 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5D36080EA;
        Mon, 16 Sep 2019 15:46:28 +0000 (UTC)
Date:   Mon, 16 Sep 2019 08:45:54 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC v2] ARM: dts: omap36xx: Enable thermal throttling
Message-ID: <20190916154554.GA52127@atomide.com>
References: <CAHCN7xJZk-7+6=13arKHdTkNoEANeZr2hUZu+AbDzw5m9vQLWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJZk-7+6=13arKHdTkNoEANeZr2hUZu+AbDzw5m9vQLWQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [190913 21:12]:
> Tony,
> 
> Go ahead and discard both the original and v2 of this.  Based on
> feedback from others, it seems like the other series I did which
> configured the temp sensor for all omap3 should be sufficient.

Yeah OK I've tagged all the RFC threads as read now.

> Once there has been enough time for people to review the other RFC,
> I'll resubmit with a more proper patch giving some of the credit to
> Nikolaus for convincing me to do this.

Yes please do :) At least I've already lost track of
all the pending patches related to cpufreq and thermal
and voltage stuff. So several complete non-rfc sets
is probably what everybody is waiting for to review.

Regards,

Tony


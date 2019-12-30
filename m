Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1CB012D2D9
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 18:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfL3RkN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 12:40:13 -0500
Received: from muru.com ([72.249.23.125]:49754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfL3RkN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Dec 2019 12:40:13 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5F2328027;
        Mon, 30 Dec 2019 17:40:54 +0000 (UTC)
Date:   Mon, 30 Dec 2019 09:40:10 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     deffo@gmx.de
Cc:     linux-omap@vger.kernel.org, aford173@gmail.com
Subject: Re: twl: not initialized and twl6030_uv_to_vsel problems
Message-ID: <20191230174010.GO35479@atomide.com>
References: <trinity-8c439dd8-69cc-4bbc-812f-a063b15a9369-1576233714035@3c-app-gmx-bs17>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-8c439dd8-69cc-4bbc-812f-a063b15a9369-1576233714035@3c-app-gmx-bs17>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* deffo@gmx.de <deffo@gmx.de> [191213 10:42]:
> Thanks for the link Adam, I fixed this on my local branch.
> 
> Concerning the
> 
> [    2.318054] twl: not initialized
> 
> error, this is due to the fact, that the twl itself is probed later:
> 
> [    3.042114] twl_probe() called
> 
> So it cannot be available at this point. Might be a fundamental problem in the chronological order of init calls?

Hmm maybe the related omap_*_initcall() needs to use *_initcall_sync()?

Regards,

Tony

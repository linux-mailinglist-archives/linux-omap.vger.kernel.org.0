Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1381BBAAD
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 19:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394144AbfIWRp7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 13:45:59 -0400
Received: from muru.com ([72.249.23.125]:34268 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389763AbfIWRp6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 23 Sep 2019 13:45:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EF9E6809F;
        Mon, 23 Sep 2019 17:46:30 +0000 (UTC)
Date:   Mon, 23 Sep 2019 10:45:55 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: omap-sham and omap-aes missing hwmod/dev_info
Message-ID: <20190923174555.GX5610@atomide.com>
References: <CAHCN7xLNFp4FVKDfmGFnKxiVMNR=3HqaNsUmXkLKCJ40=y7iUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLNFp4FVKDfmGFnKxiVMNR=3HqaNsUmXkLKCJ40=y7iUw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190820 07:19]:
> In older versions of Linux, I was able to run tests of the AES and SHA
> engines, but when attempting to load these save drivers in newer
> kernels (4.19+) on a DM3730, I get errors.
> 
> [    0.469701] platform 480c5000.aes: Cannot lookup hwmod 'aes'
> [    8.033870] omap-aes 480c5000.aes: _od_fail_runtime_resume: FIXME:
> missing hwmod/omap_dev info
> [    8.043088] omap-aes 480c5000.aes: omap_aes_probe: failed to get_sync(-19)
> [    8.050204] omap-aes 480c5000.aes: initialization failed.
> 
> [    0.510069] platform 480c3000.sham: Cannot lookup hwmod 'sham'
> [    7.900038] omap-sham 480c3000.sham: _od_fail_runtime_resume:
> FIXME: missing hwmod/omap_dev info
> [    7.909215] omap-sham 480c3000.sham: failed to get sync: -19
> [    7.914982] omap-sham 480c3000.sham: initialization failed.
> 
> 
> Does anyone have any recommendations for me on how to go about
> enabling these drivers again?

You should be able to add these with dts only in a similar
way I posted for omap3 rng.

Regards,

Tony

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9861C5BE8
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 17:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730498AbgEEPnh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 11:43:37 -0400
Received: from muru.com ([72.249.23.125]:52886 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730443AbgEEPng (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 May 2020 11:43:36 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9F46980A5;
        Tue,  5 May 2020 15:44:24 +0000 (UTC)
Date:   Tue, 5 May 2020 08:43:33 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP36 AES and SHA addresses and hwmods
Message-ID: <20200505154333.GL37466@atomide.com>
References: <CAHCN7xKe6DbNtjWzvXWFO4KMkvmmyaDDFnDWuMOKXi7B5CwJvA@mail.gmail.com>
 <7b4ffe96-7d97-81c1-629f-af56018b84ae@ti.com>
 <20200504150649.GI37466@atomide.com>
 <CAHCN7xJKhtsTBnY6HS=M_TdpJuSvkCzy8yRVijE73rkUrx7p=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJKhtsTBnY6HS=M_TdpJuSvkCzy8yRVijE73rkUrx7p=Q@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200504 23:07]:
> I wasn't seeing both clocks, but I was able to migrate the AES from
> hwmods by referencing aes2_ick and aes1_ick.

Oh OK good to hear you got it working.

> [    8.002349] omap-aes 480a6000.aes1: OMAP AES hw accel rev: 2.6
> [    8.066375] omap-aes 480a6000.aes1: will run requests pump with
> realtime priority
> [    8.425506] omap-aes 480c5000.aes2: OMAP AES hw accel rev: 2.6
> [    8.492614] omap-aes 480c5000.aes2: will run requests pump with
> realtime priority
> 
> Feel free to reject if you think I missed something.  I will admit
> that I am not fully understanding the migration path, but I used the
> RNG stuff you did to help.

OK I'll check and see if it may need to be also blocked for
n900 and other HS SoCs.

> If / when this gets accepted, I'll do the same for the SHA engine, but
> I wanted to start with one first, before moving on.
> 
> Tony - Is there value in doing the migration to other areas (like GPIO) as well?

Sure, for most types of devices we already have examples so they
can be updated whenever suitable.

Regards,

Tony

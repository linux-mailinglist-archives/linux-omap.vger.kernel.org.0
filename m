Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDFA43F770
	for <lists+linux-omap@lfdr.de>; Fri, 29 Oct 2021 08:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhJ2GsC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Oct 2021 02:48:02 -0400
Received: from muru.com ([72.249.23.125]:49686 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232116AbhJ2GsB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 Oct 2021 02:48:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 08D97807E;
        Fri, 29 Oct 2021 06:46:07 +0000 (UTC)
Date:   Fri, 29 Oct 2021 09:45:30 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <kristo@kernel.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
Subject: Re: DRA7 clock question
Message-ID: <YXuYitB4tW1JwCW+@atomide.com>
References: <CAMuHMdUjdQrwV-dP=8n1NQ_AZU7-oAjhmVv2hZBEJHQF5zynCQ@mail.gmail.com>
 <d0c128b2-8de1-85b6-52d0-21f7346a98bd@ti.com>
 <bb6a0a28-8419-f131-caf6-aed1b5261c6b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb6a0a28-8419-f131-caf6-aed1b5261c6b@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <kristo@kernel.org> [211029 05:35]:
> On 28/10/2021 19:13, Grygorii Strashko wrote:
> > On 28/10/2021 18:16, Geert Uytterhoeven wrote:
> > > 
> > >              state <<= __ffs(ad->idlest_mask);
> > > 
> > > state is shifted again? ...
> > 
> > this is probably copy-paste err
> 
> Yeah, this looks like something for someone to fix. The bug has been masked
> by the fact that the autoidle_mask for dra7 is always 0x1, meaning the shift
> value becomes zero.

Heh nice lucky bug there :)

Regards,

Tony

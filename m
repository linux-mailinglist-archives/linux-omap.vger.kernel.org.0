Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF51412FB86
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2020 18:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgACRXa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jan 2020 12:23:30 -0500
Received: from fgw20-4.mail.saunalahti.fi ([62.142.5.107]:63846 "EHLO
        fgw20-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728065AbgACRXa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jan 2020 12:23:30 -0500
Received: from darkstar.musicnaut.iki.fi (85-76-105-219-nat.elisa-mobile.fi [85.76.105.219])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id c0dd2f8e-2e4d-11ea-826b-005056bd6ce9;
        Fri, 03 Jan 2020 19:23:27 +0200 (EET)
Date:   Fri, 3 Jan 2020 19:23:27 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [BISECTED, REGRESSION] OMAP3 onenand/DMA broken
Message-ID: <20200103172326.GF15023@darkstar.musicnaut.iki.fi>
References: <20200103081726.GD15023@darkstar.musicnaut.iki.fi>
 <6D46CA13-2E50-4144-86F1-CE4988BD654D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6D46CA13-2E50-4144-86F1-CE4988BD654D@goldelico.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, Jan 03, 2020 at 09:46:58AM +0100, H. Nikolaus Schaller wrote:
> > Am 03.01.2020 um 09:17 schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
> > When booting v5.4 (or v5.5-rc4) on N900, the console gets flooded with:
> > 
> > [    8.335754] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.365753] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.395751] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.425750] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.455749] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.485748] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.515777] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.545776] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > [    8.575775] omap2-onenand 1000000.onenand: timeout waiting for DMA
> > 
> > making the system unusable.
> 
> I can confirm that this issue exists but so far we failed to bisect
> and make a proper report.
> 
> Sometimes the system boots fine and sometimes it fails.
> 
> It happens on omap3-gta04a5one.dts only, but not with omap3-gta04a4.dts
> (both dm3730 but different NAND).

I tried three different boards (N810, N900 and N950) and it always
fails reliably.

A.

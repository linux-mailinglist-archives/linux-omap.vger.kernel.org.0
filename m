Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBE21625C2
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 12:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgBRLtH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 06:49:07 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:49146 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgBRLtH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 06:49:07 -0500
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23990406AbgBRLtDy8MJa (ORCPT <rfc822;linux-omap@vger.kernel.org>
        + 1 other); Tue, 18 Feb 2020 12:49:03 +0100
Date:   Tue, 18 Feb 2020 12:49:02 +0100
From:   Ladislav Michl <ladis@linux-mips.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
Message-ID: <20200218114902.GA259088@lenoch>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
 <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
 <20200217182906.GA140676@lenoch>
 <012228CC-2B49-4AAE-B574-92E44621F0D6@goldelico.com>
 <20200217190745.GA147152@lenoch>
 <017C406F-0DD9-478F-8AD5-D950A4000305@goldelico.com>
 <20200217201911.GA168683@lenoch>
 <CEE4951F-085A-4D9C-AD15-F63C80D958EB@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CEE4951F-085A-4D9C-AD15-F63C80D958EB@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

On Mon, Feb 17, 2020 at 09:25:32PM +0100, H. Nikolaus Schaller wrote:
> > The rest of discussion
> > would need disassembly and I'll do it once I'll be waiting for yet another
> > long run recompile.
> 
> :)

Just FYI, original compiled with gcc-8.2.1:
   text    data     bss     dec     hex filename
   4358     104       0    4462    116e drivers/extcon/extcon-palmas.o

Your patch:
   text    data     bss     dec     hex filename
   4382     104       0    4486    1186 drivers/extcon/extcon-palmas.o

My patch with printing error value:
   text	   data	    bss	    dec	    hex	filename
   4406	    104	      0	   4510	   119e	drivers/extcon/extcon-palmas.o

So even without disassembling numbers speak for themselves :)

	l.

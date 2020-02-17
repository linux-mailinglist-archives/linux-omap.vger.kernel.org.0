Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28C70161C3B
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 21:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgBQUTP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 15:19:15 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:59506 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbgBQUTP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 15:19:15 -0500
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23990941AbgBQUTLxjRK5 (ORCPT <rfc822;linux-omap@vger.kernel.org>
        + 1 other); Mon, 17 Feb 2020 21:19:11 +0100
Date:   Mon, 17 Feb 2020 21:19:11 +0100
From:   Ladislav Michl <ladis@linux-mips.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
Message-ID: <20200217201911.GA168683@lenoch>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
 <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
 <20200217182906.GA140676@lenoch>
 <012228CC-2B49-4AAE-B574-92E44621F0D6@goldelico.com>
 <20200217190745.GA147152@lenoch>
 <017C406F-0DD9-478F-8AD5-D950A4000305@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <017C406F-0DD9-478F-8AD5-D950A4000305@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

On Mon, Feb 17, 2020 at 08:33:52PM +0100, H. Nikolaus Schaller wrote:
> Hi Ladis,
> 
> > Am 17.02.2020 um 20:07 schrieb Ladislav Michl <ladis@linux-mips.org>:
> > Linux kernel prints so many lines on bootup and only few of them are
> > valuable. Lets improve it by printing error value to give a clue
> > why it failed.
> 
> Hm. The upstream code does already print the error. This feature is not removed.
> But it is also printing an error in the EPROBE_DEFER case as well, where it is
> not needed or not an error.

It seems you missed I'm printing also error _value_. The rest of discussion
would need disassembly and I'll do it once I'll be waiting for yet another
long run recompile.

	ladis

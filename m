Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC66B1B0F48
	for <lists+linux-omap@lfdr.de>; Mon, 20 Apr 2020 17:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgDTPIG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Apr 2020 11:08:06 -0400
Received: from muru.com ([72.249.23.125]:50448 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726748AbgDTPIG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Apr 2020 11:08:06 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3385F8027;
        Mon, 20 Apr 2020 15:08:53 +0000 (UTC)
Date:   Mon, 20 Apr 2020 08:08:02 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200420150802.GR37466@atomide.com>
References: <20191217004048.46298-1-tony@atomide.com>
 <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
 <20200416184638.GI37466@atomide.com>
 <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
 <20200417164340.3d9043d1@aktux>
 <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
 <20200417150721.GL37466@atomide.com>
 <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200417 21:04]:
> To me it looks as if reading hqd too quickly after omap_hdq_runtime_resume()
> may be part of the problem, although it is 0.4 seconds between [   18.355163]
> and [   18.745269]. So I am not sure about my interpretation.
> 
> A different attempt for interpretation may be that trying to read the
> slave triggers omap_hdq_runtime_resume() just before doing the
> first hdq_read_byte().

Hmm so I wonder if adding msleep(100) at the end of
omap_hdq_runtime_resume() might help?

Regards,

Tony

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94F53564BA
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 09:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243822AbhDGHH6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 03:07:58 -0400
Received: from smtp-18-i2.italiaonline.it ([213.209.12.18]:53121 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234048AbhDGHH6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 7 Apr 2021 03:07:58 -0400
Received: from oxapps-11-062.iol.local ([10.101.8.72])
        by smtp-18.iol.local with ESMTPA
        id U2HxlPMnAgCmjU2Hxl8ysS; Wed, 07 Apr 2021 09:07:45 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617779265; bh=slIShbV1YkY+zgU6LQeffA5sjh62E5ntWRjeWAOcOxo=;
        h=From;
        b=OOhHe0HFgsfQyxVnWChjeIHWLpZG2r5gx6CbfKY/XdHQvR8/jndm6kqGN5SNOhoqr
         MaOAdeaBHpEj3DaZUetKApBXvyDl5YVcgy8HP+BxtaXOyUoJEYbPLE2nlQz47onR+t
         8dCA8lB9UTgFrNznYrHwL6YfPVvk+47iDgsbIWrjEr4PVWtm6sbFWkId5b9jKnKDQ7
         0wwoxMORqviXRNNcyrelQWiSOa0+vYrftpXmYgyfkD/wRPrN7PbhiAhDGMb1FPaaJa
         eDv9QDqczgJqY0pBMCftB2nOYErICn7CD89d1Qc0U/pBvtykB6RSxlCPO95yx3ulVF
         xzM7kUZFwkuQw==
X-CNFS-Analysis: v=2.4 cv=X5uXlEfe c=1 sm=1 tr=0 ts=606d5a41 cx=a_exe
 a=ArCppHiS2LX9rvfu7+HyXQ==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=VwQbUJbxAAAA:8 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8
 a=FNPkBufVjW-pSWU66ZIA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=IC2XNlieTeVoXbcui8wp:22
Date:   Wed, 7 Apr 2021 09:07:45 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Message-ID: <1044574275.383115.1617779265390@mail1.libero.it>
In-Reply-To: <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
References: <20210402192054.7934-1-dariobin@libero.it>
 <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
 <1727466283.11523.1617746554330@mail1.libero.it>
 <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: 4B1r2KzBl4CpwZXlo+hXrxuxGTg7xe5x
x-libjamv: GQ+1IhXvsBI=
X-CMAE-Envelope: MS4xfHfxE8O88fnOmjkXI5v0GaptnmPsV5ss65BoVwigbqdYVHsVbsa+T9D4kj/44XpP0xepNXZYcrVSZdiEwnTWDc6knltvuuv+B70YwruAw1yZZg5SFNu2
 V7t5OTCSrMxQxisucWGltfXJ77rqnGtEMT97cRiM3GW0jcFg+D5uc6wdoTCpufNirHQfvB7Outl6WzC632jicj7Hh9G/MVRE/9MNu+zzQcGtuPs+QvhBugKZ
 K1HnTECmPzC2zD/uHQ75HVUunx3/8qsl517fwEaz7fo1RC9GK29ft78xRbvDgBB8ROkW6a8d/vUfG/WvqmOaffJ29W+Tr9pkuWqXbJQ7fa19RE6cSjjhkQS4
 IBpFSG3KutNkmTX8VGv9jkL9J1KHdB8UKICiVRITK37O+pmq7/rh1Un9JcDddbcXWXfP2c73B/sWKU+z5mxcH6NIlm212q/dk/8fq0D0FG3TfLkXPDhHYBgP
 w3H0CDAfqaDGAaIB+4v1LmgH6G1Xdk1CPSb8yA==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Il 07/04/2021 03:16 Rob Herring <robh+dt@kernel.org> ha scritto:
> 
>  
> On Tue, Apr 6, 2021 at 5:02 PM Dario Binacchi <dariobin@libero.it> wrote:
> >
> >
> > > Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
> > >
> > >
> > > On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
> > > >
> > > >
> > > > The series comes from my commit in U-boot
> > > > d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
> > > > and from the subsequent exchange of emails at the end of which I was
> > > > suggested to send the patch to the linux kernel
> > > > (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
> > >
> > > It's 'ranges' that determines translatable which is missing from the
> > > DT. This should have not had a 0 size either though maybe we could
> > > support that.
> >
> > I have replied to the email you sent to the u-boot mailing list
> >
> > >
> > > Does the DT have to be updated anyways for your spread spectrum support?
> >
> > The spread spectrum support patch does not need this patch to work. They belong
> > to two different series.
> 
> That's not what I asked. Is the spread spectrum support forcing a DT
> update for users? 

Yes, the deltam and modfreq registers must be added to the DPLL clocks. 

> If the DT has to be changed anyways (not really
> great policy), then you could fix this in the DT at the same time.

I could put the fix to the device tree in that series, although I wouldn't 
create a single patch to fix and add the SSC registers. First the size-cells = <0> 
fix patch and then the SSC patch. 
Do you agree?

Thanks and regards,
Dario

> 
> Rob

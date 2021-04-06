Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862B2355E57
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 00:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbhDFWCv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 18:02:51 -0400
Received: from smtp-16-i2.italiaonline.it ([213.209.12.16]:38006 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239677AbhDFWCt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Apr 2021 18:02:49 -0400
Received: from oxapps-32-144.iol.local ([10.101.8.190])
        by smtp-16.iol.local with ESMTPA
        id TtmMlF7I2f2ANTtmMl5syE; Wed, 07 Apr 2021 00:02:34 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617746554; bh=akIOS2LFU8AbnXeSKX/lN7kLwCQ59toKE6VoSYcU7p4=;
        h=From;
        b=BBHr4D4cYuWFL1NfC8JTa9C2WGMjscDa/CfrMMvK7A6woSjzh84OV2DcgKLxL3sM/
         +3YMv34N3NV6csEv/fQ7WjHjS1i/4oVxITUXoa4Ad1tzRxGZ6hu2T7X8P3Im9dYIH1
         QQu8S0xY6y8KC38FEQU6Sq34LXDywwpVGNz217OeCUbVGGnWmvyAmEjtpT0Y5ij64j
         wk7vz5dOvW6cMo+PFLX9Kv/nPSwX2KKbrProes+dNgnyGz70HKkA2+V18bleDPj+aI
         uJ857pBimg5qiEAwgeoSPOX0Ewby1NcoAKWPx09h6qGO56l5xjgR+CGVRxPQpi1/SB
         7TDT2CkOTNIoA==
X-CNFS-Analysis: v=2.4 cv=Adt0o1bG c=1 sm=1 tr=0 ts=606cda7a cx=a_exe
 a=+LyvvGPX93CApvOVpnXrdQ==:117 a=UPWQtH3J-JgA:10 a=IkcTkHD0fZMA:10
 a=_gZzKa99_6AA:10 a=VwQbUJbxAAAA:8 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8
 a=aW_EbgM9uDbL71VJ2OAA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=IC2XNlieTeVoXbcui8wp:22
Date:   Wed, 7 Apr 2021 00:02:34 +0200 (CEST)
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
Message-ID: <1727466283.11523.1617746554330@mail1.libero.it>
In-Reply-To: <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
References: <20210402192054.7934-1-dariobin@libero.it>
 <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 87.20.116.197
X-Originating-Client: open-xchange-appsuite
x-libjamsun: 0kJUj9J8+FPQ/YxkwJqhiHCIFaYs727T
x-libjamv: J5mKezAXc6M=
X-CMAE-Envelope: MS4xfLhjxEr/Kp9gu70nyFP13JwXaIfRPj46VyjgR1MpMlp1MPqhqnicFn3XKmrgI2HHVMBkQrAnRDtuhTp+X7ZB9C+nElMvNkK/Roo+m6hQd5Q9kbYDgKvy
 6Ib7IWoJecJ0Ca+PzBVKZVAyAiPDq7SgF/tHh3iqZvy4VNQTsgsJeo42wLLyr64ND0bVofM9/EYEDxe+ZXPTBtmf9pzVkzOe/VrBiHPCgNCJNg64NEXzGyGG
 YFt8rQ/8nF0d7F8kFMkPFeA8VJ2EPSKAi6Qih4/c7I8RL9Fr5YhiW0idb40hvnM1mckqpfvKyZrK78Z9MT49XWg4jbPsLO8GKSi4kU4eQ5X72Xz8DW4mDgYO
 rULeuWi9FhAZCbSWV4XYJxEQBQcIb4KL198/rG98gpFnvERGD5PKlAuISxfSxKjUc6iIfZSOuMufo98WwNGc2GMa0DYEREP72cuDQRg2u6hjOUvstlWcRusP
 ZUgDgjF/JUUaOsXlp7b/3WVRrVogfshs71oTrg==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
> 
>  
> On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
> >
> >
> > The series comes from my commit in U-boot
> > d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
> > and from the subsequent exchange of emails at the end of which I was
> > suggested to send the patch to the linux kernel
> > (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
> 
> It's 'ranges' that determines translatable which is missing from the
> DT. This should have not had a 0 size either though maybe we could
> support that.

I have replied to the email you sent to the u-boot mailing list

> 
> Does the DT have to be updated anyways for your spread spectrum support?

The spread spectrum support patch does not need this patch to work. They belong 
to two different series.

> 
> > The second patch of the series aims to demonstrate that the first one, which
> > enables the translation of addresses also for crossings of DT nodes
> > with #size-cells = <0>, it really works.
> 
> I don't seem to have the 2nd patch... In any case, you should handle
> the special case for this platform in code for the platform.
> 

the 2nd patch:
https://lore.kernel.org/patchwork/patch/1407108/

Thanks and regards,
Dario

> Rob

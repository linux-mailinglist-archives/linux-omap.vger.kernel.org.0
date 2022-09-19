Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4A55BC3FF
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 10:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiISIHc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 04:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiISIHb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 04:07:31 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3661213DF3
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 01:07:28 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id y5so2671431wrh.3
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=beljlY/dq1X8C0xtWQyzuHw+BMcd2pT8AiZMtDMqVeA=;
        b=fgH9ZG+jH9Xw0c8mznQnwpKG4lWazxSkHCMNRmDOfpvK29k8M0ncKWbsRsk9QpruyG
         pyyYDRbr8YJRQ1CEFNJm87x73lszOXRhQDWq6WVKL1IlGp93sUKT+BXqP5RxQ1KSAABP
         Zym0Uqk9WA+6wu1G6xptkMTQvI6F/cbLV2IxLPCjmlAzjP+ARxrSPfVCKtbi2cWYVcgj
         A4T1p5vIo/d6fWgD/mgd8TW+3l5LGxXrIyUquoxdQ3/HBS5SQCEjuf6+6/nx+0Qks3PO
         cfiJuIuZ+hWryffEiTlwp8yFdn6x7JvIr2TTcEMpD+aBcq3LccDLi9HtkasLvQf4jdLl
         +bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=beljlY/dq1X8C0xtWQyzuHw+BMcd2pT8AiZMtDMqVeA=;
        b=K5aI/YStLa7rkpY0irnYcCR4bbAjz4bLsJUev2ufjXETEY1IDSiDMmT4e6uuilVJLC
         D7JlSGBAEvIzXMTIBI5cMGm0X78D358lW2HnFC48MXswFRy8p063HEA6bY2q2nL6OML2
         ICZ5h4y8vcIjfarARqOx2GdpnUeA+0fNPWdnZCPkKv3vNIXOq1k0xjrehA5FB3VgHb6A
         0qmR6vgyafsi49pNPnR3FxiK52d/SJ4BDvZdIkEKwDs0uV9gDTudWrBw4SWepOtsETcu
         u/6sH9/RczDsoboL0jOLY+e40HzkVCy+u7czQ8rQj1W+zBxXn8/pHLnkgtBXvJpBEEkG
         ZEag==
X-Gm-Message-State: ACrzQf3bETx8FO3ei6gbg7bRmCacLkvfxKMxzkPB+WkiDIFth7Co/aw7
        QUTeEtvuhyMsSoe3YLiL587dVs9Wc8IPSQ==
X-Google-Smtp-Source: AMsMyM4N932KQrg5AunFdLF9rK2NW2Mw/sXQqIeP/llIq8t5XnmZwSuAbYtI39z/FQG0/Pcbh0mqSg==
X-Received: by 2002:a05:6000:257:b0:22a:43da:b17c with SMTP id m23-20020a056000025700b0022a43dab17cmr9214612wrz.203.1663574846711;
        Mon, 19 Sep 2022 01:07:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d4242000000b00224f7c1328dsm13055547wrr.67.2022.09.19.01.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 01:07:26 -0700 (PDT)
Message-ID: <28dc112e-94ce-ca21-2e35-97074f251b97@smile.fr>
Date:   Mon, 19 Sep 2022 10:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: prueth: IEP driver doesn't probe anymore
Content-Language: en-US
From:   Romain Naour <romain.naour@smile.fr>
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org >> Roger Quadros" <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Md Danish Anwar <danishanwar@ti.com>
References: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
In-Reply-To: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

Le 16/09/2022 à 10:55, Romain Naour a écrit :
> Hi All,
> 
> I'm able to use the prueth driver on a AM5749 cpu using the TI vendor branch
> (ti-linux-5.10.y). But I need a more recent kernel to support other device on my
> custom board. So I had to rebase all the TI work related to the out of tree
> prueth driver on a the latest kernel.
> 
> I hope this driver will be merged in the kernel soon but the series [1] doesn't
> include the prueth driver for AM57xx cpus (only the icssg_prueth for AM65xx is
> included).
> 
> For some reason the IEP driver [2] [3] doesn't probe anymore. Is a side effect
> of recent ti-sysc or legacy platform data work ? I'm using a 5.19.8 stable kernel.
> 
> The prueth_probe() error out with "unable to get IEP" log message.
> 
> Do you have any clue?

I tested several kernel releases between the 5.10 and 5.19 and It turn out that
the issue appear in the 5.13.y kernel.

After a long and time consuming git bisect, the first bad commit is:

Merge tag 'arm-soc-5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=01d7136894410a71932096e0fb9f1d301b6ccf07

Yes this is a merge commit from Linus.

I tested the kernel from each commit parent and the prueth sill works.

So I rebased the branch arm-soc-5.13 merged by Linus to have a fast-forward
history. The second git bisect return this commit as first bad commit:

ARM: dts: Move dra7 l3 noc to a separate node:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7f2659ce657e87cb7f47e6b15099608eaa1349ac

The switch to ti-sysc seems to have some side effect on some driver like pci-dra7xx:

"After updating pci-dra7xx driver to probe with ti-sysc and genpd, I
noticed that dra7xx_pcie_probe() would not run if a power-domains property
was configured for the interconnect target module."

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e259c2926c016dd815e5547412356d378fc1f589

This is my current understanding of the issue... but I don't understand the side
effect of the move of the dra7 l3 noc node. Also, there is something merged
before the 'arm-soc-5.13' branch that is a second cause of the issue.

Best regards,
Romain

> 
> Danish, if you can provide a new version of the "PRUSS Remoteproc, Platform
> APIS, and Ethernet Driver" series including the prueth and iep driver for
> AM57xx, I will be able to test it [4].
> 
> Thanks!
> 
> [1] https://lore.kernel.org/netdev/20220406094358.7895-1-p-mohan@ti.com/
> [2]
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=d3bf5a58c356a90fe14d34f213d6195b9a946dc5
> [3]
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=7cb095866c8b436176dd783878a9e9c3c0bada0b
> [4]
> https://lore.kernel.org/linux-remoteproc/992019ad-5c58-d420-8a18-a82228f8e086@smile.fr/
> 
> Best regards,
> Romain


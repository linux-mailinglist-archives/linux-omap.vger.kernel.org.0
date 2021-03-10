Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC4C333FAE
	for <lists+linux-omap@lfdr.de>; Wed, 10 Mar 2021 14:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhCJNyi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Mar 2021 08:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhCJNyd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Mar 2021 08:54:33 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD0AC061760
        for <linux-omap@vger.kernel.org>; Wed, 10 Mar 2021 05:54:32 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id p15so25642776ljc.13
        for <linux-omap@vger.kernel.org>; Wed, 10 Mar 2021 05:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telliq.com; s=google;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=LnieKbR1sQg1mAtsZUa22eMkB6iSaXuJyq8ZlNF/US4=;
        b=NrP1reGTTbYR9yAtVXHeNfeEwBnwsvul8i7FL4bJtUFgddNQFnwl3IdfGt1gA+rhJj
         wd7AcDbWPhZBGfU3jJ0GkjcjBzdrGbN4HuyXlPkRROygew/glcW3rG3/z1lyD+XEUPbK
         NVerWvTSH60/BPloDQFAioD8fDOpj3bPfVq0ZCSRgDOzfSGzjTBSI9XzMR4KSs/h0asD
         tpqEBG1Eu5/8g/oCVXkn2fqXerS7PYlWISwgJQVgTW7p8u4Lvnd/mUlXzeIcJ7zm1F+K
         Gj5/q4sptvKiaf9uS2OFfMolhfVWwNFt0WmLd6gOYqxRJEe4BI35SGyqYA0A73gPy3mN
         RlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=LnieKbR1sQg1mAtsZUa22eMkB6iSaXuJyq8ZlNF/US4=;
        b=KGtINxTCfX1TaGZH7x5b57z2YhDSq2aRh6Bx6RxdPNj4IDHTOtNI0enegjEnjwCP0B
         b/7fbRbDFAHYju4qVoMESRPDrahYkdxOEUVNyLugrkpCI1cSYfCmNYbGZ2fQR7D47HIi
         B8FBnF8D7EW1CTt7ANrW/A1BqgkeG9SErwAwViNCPUnYnJrAt0zzHjLRXsKrB21e20no
         THRiFKJKrsemvD0tH/NR+3fbSZUASpRoea6O8e/xiqHTRf72vXz8zCL7K79skASOkfU2
         V12Nqk0wps27s9dq0pXQKyOM5ZT64NLlCgBEhLbcM6lBTfGPYE5I62csMYK36QBjThtP
         2oZg==
X-Gm-Message-State: AOAM530tEipLZXBdibLKFCDSG+tznNTpACGt1KdkgDTmFP44fvLF+dsN
        Frn2XD7A9bBVLCRSBiBuXMi3Ug==
X-Google-Smtp-Source: ABdhPJxEHQ8LAoylBqUOEpRlv3nouEzg0BCQ0INlp19o7MMfm2LT9WvInOwjI1rCpoZDQ4tmPcMMkA==
X-Received: by 2002:a2e:9c12:: with SMTP id s18mr1865809lji.383.1615384471365;
        Wed, 10 Mar 2021 05:54:31 -0800 (PST)
Received: from polera.kvasta (h77-53-209-86.cust.a3fiber.se. [77.53.209.86])
        by smtp.gmail.com with ESMTPSA id r5sm3176931ljh.128.2021.03.10.05.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 05:54:31 -0800 (PST)
From:   Jan Kardell <jan.kardell@telliq.com>
Subject: arm: lockdep complaining about locks allocations in static memory
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Message-ID: <6df24716-8b41-8e9a-f2f4-a0f5d49643bd@telliq.com>
Date:   Wed, 10 Mar 2021 14:54:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

During work lift the software and kernel versions on our custom TI 
am3352 board I started to see lockdep warnings after enabling 
CONFIG_PREEMT. Lockdep seems to think the memory that previously was 
initmem is static memory. I'm using linux 5.4, as that is what is used 
in the next OpenWrt version.

[ 92.198989] WARNING: CPU: 0 PID: 2015 at kernel/locking/lockdep.c:1119 
alloc_netdev_mqs+0xb4/0x3b0

I guess CONFIG_PREEMT just changes the timing of allocations, and is 
otherwise irrelevant.

This was fixed for s390 in linux 5.2 commit 
7a5da02de8d6eafba99556f8c98e5313edebb449 by adding the function 
arch_is_kernel_initmem_freed(). Later a very similar change was made for 
powerpc, and a different solution for x86. I now believe that is needed 
for arm as well. Though I don't know the inner workings of arm memory 
management so I don't know if an identical solution to s390 will do for 
arm, but my experiments suggests it works for am335x. The commit message 
for s390 says "virt == phys", but that seems not to be the case for my 
arm system.

//Jan


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15DF39DFE7
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jun 2021 17:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhFGPDV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Jun 2021 11:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhFGPDV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Jun 2021 11:03:21 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F53C061766
        for <linux-omap@vger.kernel.org>; Mon,  7 Jun 2021 08:01:13 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mp5-20020a17090b1905b029016dd057935fso3958450pjb.5
        for <linux-omap@vger.kernel.org>; Mon, 07 Jun 2021 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :cc:to;
        bh=c6lS5jVu2RDUwENs0JrLiyky+UckiXz1Cm2F3jo+4Pw=;
        b=TMUNQLO0OAKuz/TU2kBmCwtYFKiIfwPjsh0Pu2ug+h/cnb4tq3SuwSZLjy1u1EIM7E
         sp4Bfc6VUuCpHfUgqQ82znAM8O7dYNwiTgXhPeLwFoILRMng8lqtCZlPhMWByuNA9Yyp
         Nj0DgvXHrMbN1+G+jWNt37hD5gDNPvKH4Txx6uetGOz10PM0qZFz1l673bZW72qAVlVP
         tGVmIsAjfRgeL2ZruQ28PvjlLVW/92EeJkIY3WmkdqMR8DiF1sJ9/hLOX5ocY0fT4prY
         HEwPJB3SUAwcxzwNK5tB9dvKTg0F+sZhy1eOYnV7vsdaaQzciGV1upe5aaw4nk/hHtg3
         quOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=c6lS5jVu2RDUwENs0JrLiyky+UckiXz1Cm2F3jo+4Pw=;
        b=bsE9dPkFFtBCBMKRu8q4Or2SZSBo0jmRS52PvIyqpHQQyzVigJ4P3faoTXZ//iwpo1
         Xf1+iESJjrp0w8K3BQ/YWsdMsNDuQHyqM1THd/QvvG3saF0w+JBlna96F5k6/KPSiiKI
         ojiU6eScTH5SOcKxJpspT4StLXpVeRbVYBrbLvpmwTN1p1SUT/NrnuuMw6AJXUveh8P8
         3LwVmiTtD4JsnmPd4irNW2HD++DIiB8LIsLR/98qY60lPqiNj3dUWWbSagiDSHAtUiI9
         MDit3dF+srGi6e9XsajeuntkXS4y3YwASVHAj+LZ0Mgu/H9CCZiQtksR1YgzIH8dP412
         88bQ==
X-Gm-Message-State: AOAM531DttV2W7ix3I5jwru5+fLDgi+UoTeZhGul/NFr1c078U6hVrde
        a1QWExaWEV1TYtjoUv7bZARV6UW0l0c=
X-Google-Smtp-Source: ABdhPJyEQMcWUM0+zwVK2MrpjDMAKB+GrQse9E2Jyj5Ehg+yZv5ecYQc/hFeGNVzC2r+cBEdVgjV5A==
X-Received: by 2002:a17:902:7c92:b029:111:2ca8:3d8e with SMTP id y18-20020a1709027c92b02901112ca83d8emr10042359pll.77.1623078072943;
        Mon, 07 Jun 2021 08:01:12 -0700 (PDT)
Received: from ?IPv6:2600:8800:6880:151:e8c3:ffb7:5932:122e? ([2600:8800:6880:151:e8c3:ffb7:5932:122e])
        by smtp.gmail.com with ESMTPSA id ft16sm6919019pjb.28.2021.06.07.08.01.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 08:01:12 -0700 (PDT)
From:   David Russell <david.russell73@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Message-Id: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
Date:   Mon, 7 Jun 2021 08:01:10 -0700
Cc:     linux-omap@vger.kernel.org
To:     tony@atomide.com
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Good morning,

I have a legacy project that runs on an OMAP2430 and is based on the =
linux-omap repo (tag v2.6.28-omap1).  I am in the process of upgrading =
the project to mainline v5.10; I have been able to get most issues =
resolved (e.g., USB DMA still fails, but PIO works for now), but have a =
difficult problem that I am hoping someone might lend an idea to.  We =
have a custom DSP driver that is responsible for resetting the DSP, =
downloading the firmware, setting up the mailbox and then managing the =
communication between the ARM and DSP.  I have the driver mostly ported =
(i.e., compiling) and am working through the behavior.  At probe-time =
there are several ioremap=E2=80=99s of IVA2.1 memory (0x5c800000 and =
0x5d000000 =E2=80=94 the internal SRAM and the MMU).  The ioremap=E2=80=99=
s succeed without error, but as soon as I simply try to read the =
revision register at 0x5d000000 the ARM hangs (i.e., not even a kernel =
panic message is presented, the console just freezes).  I assume that I =
am missing a clock or some module is powered-down, but am not sure.  =
Interestingly, in arch/arm/mach-omap2/iomap.h it is explicitly noted =
that the 2430 IVA2.1 is not mapped =E2=80=94 I attempted to add these =
mappings to the 2430 table which resulted in zero console output of the =
kernel boot (i.e., I can see the x-loader console output getting ready =
to launch the kernel, and then nothing).

This is a challenging problem with the console simply freezing on the =
memory access.  I would very much appreciate any ideas as to this issue.

Regards,

Dave


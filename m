Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACA03967A0
	for <lists+linux-omap@lfdr.de>; Mon, 31 May 2021 20:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhEaSNA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 May 2021 14:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhEaSM5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 May 2021 14:12:57 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CACC061574
        for <linux-omap@vger.kernel.org>; Mon, 31 May 2021 11:11:16 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id x9so5589656ilp.4
        for <linux-omap@vger.kernel.org>; Mon, 31 May 2021 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=CKWJS5cIOmdtT3ZyFcZ3LS3vZh5JhY+BZOLofV2DBnk=;
        b=iEL1t0ifHslmreyD0yOb4RQHAB5GXGyjxNCHW/TXr403cVsLveZlDwKqLtZYlbQWa/
         FZIWi2ZHpSkGQ9nbWJuZnF9oFgAdY22axKRAXbQHNNaSsgpm4ohUoqRyGHBc3xViU6v9
         4r0W0TZklH66hC1TjcbUypS/4KQHXUcs6hS9/ZYmCiyY4+ineXB97JZaEarUMmpjyXYY
         rpybMwh4N1qlmzNYb3Jnx7lp2uFze1O2snGt8jMc8MGo0PGUC3GBTsgACE4HTUEiugi1
         /0W8LLOgtRy2NEpfNRScUthEW3NveuVZCIK015tdxjbkHu2eET+YUX9igxh9ocDMFlA5
         zKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=CKWJS5cIOmdtT3ZyFcZ3LS3vZh5JhY+BZOLofV2DBnk=;
        b=LpZebSzNf9D85iiRtNBfQz/6qC1Psy9ituNLv0SavkEDC/LYwT9Q4HjoU9jBQnZK3P
         p4IOLvfpks+rrEbc5gr5QrqMPUQ12s9NbEbMseaAsHPBy5o49N7lSO1udAePS7AfhP1S
         cvs/V6wEbMRK1KWPq2G09CUI9ovGy3120zmqXjoagxKq45drqoG4DOlna592eKjLRNY2
         sEWJ/Mb7ZW9O5kmiDZXDWuxpy5sDWwXtBa9eiU0s/59MRPMqOY1uMwZ+X4nJUKMEv9Gr
         74L5yVC3SagAfdliVoDYpwdqmHTcWJzO0woWsutZFTQCLCPnRqyytfVxYI0jGDtxKjh1
         MI9A==
X-Gm-Message-State: AOAM533A+wQuRq4MaHXECRQR2b/FcSTYXfspv+TjD98nTXCgcyC+7DYP
        Az0mhgGSJyoXfcXxoiN2w4R9wHWEyiL/mJ9XpZ5UJVvAHjo2aQ==
X-Google-Smtp-Source: ABdhPJy8abD31twUB3Yx/pI81xD6lt3cKVYczvYnvKBPFHdKqnILGWFVXmavWZUusCZqlMNRFx+roFO0RRLez9+nxiM=
X-Received: by 2002:a05:6e02:1ba2:: with SMTP id n2mr19475088ili.60.1622484675780;
 Mon, 31 May 2021 11:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <CACLAQJFXr2PeuV9rJtyVTB0ib9QgsHC7W14qA_aCm9qKh81JOA@mail.gmail.com>
In-Reply-To: <CACLAQJFXr2PeuV9rJtyVTB0ib9QgsHC7W14qA_aCm9qKh81JOA@mail.gmail.com>
From:   Mighty M <mightymb17@gmail.com>
Date:   Mon, 31 May 2021 23:41:04 +0530
Message-ID: <CACLAQJEpPJJJWXQLq=wD5Zquw-c0wBFEBXTrZXm_-8R27LxfHA@mail.gmail.com>
Subject: Re: Regulators not working
To:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 27, 2021 at 10:49 PM Mighty M <mightymb17@gmail.com> wrote:
>
> My device has twl6032 regulator, and the regulators are always
> disabled and off, even after putting regulator-always-on in my dts
> they are off. Only the twl regulators are affected, the ones i added
> manually (ie fixed reg with gpio) are working fine. Here is my dts
> https://pastebin.ubuntu.com/p/pYGG2pTSjB/, my .config
> https://pastebin.ubuntu.com/p/vVFrbZ4773/  , my dmesg
> https://pastebin.ubuntu.com/p/tqCXGnPZmF/ it says
>
> [    4.330841] VAUX2_6030: 2800 mV, disabled
> [    4.334533] twl6030_reg 48070000.i2c:twl@48:regulator-vaux2: always-on 1
>
> and checking the /sys/class/regulator
> samsung-espresso10:/sys/devices/platform/44000000.ocp/48000000.interconnect/48000000.interconnect:segment@0/48070000.target-module/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:regulator-vaux2/regulator/regulator.8#
> cat state
> disabled
> samsung-espresso10:/sys/devices/platform/44000000.ocp/48000000.interconnect/48000000.interconnect:segment@0/48070000.target-module/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:regulator-vaux2/regulator/regulator.8#
> cat status
> off
> the regulator_summary https://pastebin.ubuntu.com/p/3DH6h9bkGY/
>
> I cannot understand why the twl pmic isnt working, any help?

Fixed using twl6032 compatible regs
(https://github.com/MightyM17/linux_openpvrsgx/commit/0941a578af14997bce809a490e3c4ad6974da30d#diff-064ed8561b0ba46b9cd9fb30b57da0d76f2609faeaf0df09bdb7b908ef87a363R342)

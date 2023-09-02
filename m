Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB527905C0
	for <lists+linux-omap@lfdr.de>; Sat,  2 Sep 2023 09:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351729AbjIBH15 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Sep 2023 03:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351718AbjIBH14 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Sep 2023 03:27:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4761707
        for <linux-omap@vger.kernel.org>; Sat,  2 Sep 2023 00:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693639662; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=o/xO9p7gQBXezbCxBOisyIxEmgFUOryLB6qmVnNXlIWiJ+LjecTxFa7E+I8UC1rLND
    oGOBfP9C+uCZHbRH+axzIsQqCC40h/gwbVf3Q0xg7FhZp0JjztiHO/7aZ7HMgBw98xDQ
    zUs+UQjfVF8y4MLrNENa+JE2z8X6R8hz1dxx2bQOqCx+piL+bE+Tae3SH6dOrMG76Rva
    zVtsN/V99iTr2SluXaXRywKztlWpNIKVu/ofqigAc5ytJ0AH+oP2P/Mfmuqa6dI2z8MP
    zZtpB5KLbRJ4+E0uclq9PzmF3hkMi2Rzf+LF4d+Dg5jpzMCJvgjGN8QKOZDjnrWxZs7S
    2Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693639662;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+3b1NnU12xbrBmixBzmgivgpxVziSz8o6Izzja7DwLE=;
    b=e0rYYP4AJrgA2Wmm3LdWWRS3hYgrRkdNnG4+cvUJmzqecw1UwjTYrBnUcPdHP/+W7k
    0s02vbO3HEQb0XTa024eCfU6BASy+f4cHP15Tl1ccI8JtU1QQtzqpuDz4w6FtiMP9cZn
    MVJKJPSX2fe7sy7p0qF0cKgJOLbDBKPoU7sQXCgOT40YYLGMB/lnGi0MHFZJ+E0T9ZIN
    GKqaHm/fJsvuHAqTFexMcEPgF/OAvHOxhr0Y3+H06Ent37sAmOk4b4guaYHtkB5Ws+2g
    8JjaIGgy/WcFnCaGL5wG12qCJFIb1/gj+e8J77FhD9AWB4zLwMlZjcbAbPpYRfOkXy84
    3YEw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693639662;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+3b1NnU12xbrBmixBzmgivgpxVziSz8o6Izzja7DwLE=;
    b=JGMu1J9zhMFsK9oT8YMWC4BxDfdU2s4iVmp6PwnIl/3ZrTA/uqKSPlFRtuTHVmCaZ/
    t++Wuigf7xYJlVqWhXcEmDgZvqJxarN/Ww7eXNQPoxfo5dq5M5ceFCvzK9WhWTscc12e
    cukQtLV0cRRIqJAGie2a2+PhESlGVzXu2ldtGhavKdyWZEvaz+AtTo1BNqk8UCLWScRK
    d8L0Q1N3BpW7sl/YiVjHTL8N+kF1vYuTQK8TiUviSkoWeG6rzEJcVSoVaWsVuDGhLMl0
    BjrcPYiZDYKVtawXhyHM7P2tcBKHWuzUH7gEpW3HKRNTmheZduhr7CCG/nQAUYbwyfWV
    IISw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693639662;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+3b1NnU12xbrBmixBzmgivgpxVziSz8o6Izzja7DwLE=;
    b=uPNGeYK+sn8vKA0txEwBi0NlNU/RLEfcnLXXnhae+mvPZXpSozWRdthx17iZGw0G14
    4nbBgi6MXv6WMZ3ARVAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZhzY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz827RgAhU
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Sat, 2 Sep 2023 09:27:42 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: ABE/AESS on modern kernel: clocks, hwmods etc.
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ZPLYG16mwiwt9G9R@dalakolonin.se>
Date:   Sat, 2 Sep 2023 09:27:41 +0200
Cc:     =?utf-8?Q?Patrik_Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        Andreas Kemnade <andreas@kemnade.info>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
References: <53bc74ae-a2d5-40d5-8d51-bc0f062fcd15@email.android.com>
 <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
 <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
 <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
 <ZPH5Yr3w7ruN/io0@dalakolonin.se>
 <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
 <ZPLYG16mwiwt9G9R@dalakolonin.se>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,
we are still struggling with ABE/AESS on the OMAP4/5 (PandaES, Pyra, =
OMAP5UEVM, BT-200).

Symptoms are that
* pmem access will be broken after initializing the ABE-DSP
* it seems the AES DSP is not running (and leads to timeouts when =
sending audio data to the buffers)
* boot issues on BT-200

What we have found is that a TI kernel v3.8 works on the OMAP5EVM but =
newer kernels start to fail.

A major observation ist that hwmods have been removed in smaller pieces =
and the last removal
was in v5.6: c33ff4c864d2b ARM: OMAP2+: Drop unused PRM defines for =
omap4

There are also some other unknown factors in our code where we do not =
know how to port to modern
kernels:
* there is a context lost code but how to make use of it?
* pmem fails unless we disable omap_aess_write_event_generator(aess, =
EVENT_TIMER);

It seems as if clocks and code like omap_hwmod_aess_preprogram() is =
missing. Especially for the
omap4 we have found no equivalent to aess_fclk which exists for omap5 =
and dra7.
Nowhere is a reference using the abe_iclk node.

This would mean that power/clock management for ABE/AESS is =
incomplete/missing.

So maybe can you review our device tree definitions?
Our patched DTS is included here:

https://github.com/goldelico/letux-kernel/tree/letux/aess-v12
=
https://github.com/goldelico/letux-kernel/tree/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap

and compare e.g. with the old hwmods code which is doing quite special =
AESS setup like

=
https://elixir.bootlin.com/linux/v4.18.20/source/arch/arm/mach-omap2/omap_=
hwmod_reset.c#L43
=
https://elixir.bootlin.com/linux/v4.18.20/source/include/sound/aess.h#L37

I hope that I properly summarized the discussions with Patrik and =
Andreas who please add if
I forgot something important.

BR and thanks,
Nikolaus


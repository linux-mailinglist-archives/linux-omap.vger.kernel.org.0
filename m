Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C37194CB3
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 20:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfHSSZP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 14:25:15 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:42052 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbfHSSZP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 14:25:15 -0400
Received: by mail-io1-f48.google.com with SMTP id e20so6416927iob.9
        for <linux-omap@vger.kernel.org>; Mon, 19 Aug 2019 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=opQ39o8B5M21Bz9y0C7CUEZ/cYIWG2j1m2cRt2hEGfE=;
        b=bUoXCH5uSGV+FYAgRIXXIFr+ZpuqBtEeTJDBP7u1+rl7kAlL2r510U4tmJpr3rsvTb
         llfhdblLucLPhIYbhWf6upzaX58QDyFyy0UuJ5Q5jJnRTr8JEHabzX81l2J2OY21I9Al
         c0G1R7zrJ7qq5INXgsKAkBApyohYQXgq/Qsyb2jQDCHxzkjX1eTbVPx/UOb3CIlr6Qor
         i77Ho169614kM+ptJpO/7fze8FX0tZ/FcP+Ub17bdMmPlk/4iV1Gj1Abki+kRDOCS5xm
         NJ9lWtCnMaCARd1raXuR3c9LticEjnbUMoXk1Kxpq0aX0Lv3qU495r6iCYn4M6MyRqXZ
         xexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=opQ39o8B5M21Bz9y0C7CUEZ/cYIWG2j1m2cRt2hEGfE=;
        b=l3buWWEi5UgskkpmQY8jfKG6x8We1GkOB2WUKBHEaw1Mej3NK2Ha0bw7gCDmfZYEPe
         hEthR7wN8UP9lZYWjdAhnofgTtjirSwm75QR1rWOfJTAW9802xParredt/FMVv3oj642
         QvsAwyn+7IldIVpgKs6CY6SSfHXZ1hcsX227zyuzXgXoXpPsZH8p7jbIc9ZhUCVgVuu/
         /Bg157wlyCBs+o6fv38V0UZ9DJTnLic1AWDhlQrL+DqYiE66xIslGwL/5hLdRtw6vp9J
         9iMepKQxjpu3YQEzY3Udp7fpAmOsr/csoDn8Vf9fFV8doQTsjeAP0HOqw4JFXbSpDsTk
         4k5A==
X-Gm-Message-State: APjAAAUccreXRJJaaEGvxgNg92SAXK2cJmYJ5ksR25c11qXhi6q6T2tt
        Ix4DA5DUDcmpW0Dvw3x0lsj6Lb6Xz1t7JKSb6si+DE+AhaE=
X-Google-Smtp-Source: APXvYqwD9luPorGVJNxKuZI+WvwRUu53y8YJuQLlvERRPRrXu9YkaLr7aFCq2jTCHy4KYVsdw1ZiLJnfWY8lAshhGSk=
X-Received: by 2002:a6b:c98c:: with SMTP id z134mr7050264iof.276.1566239113814;
 Mon, 19 Aug 2019 11:25:13 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 19 Aug 2019 13:25:02 -0500
Message-ID: <CAHCN7xKYEdxZwhuQCOS6UA+BQCVHDH=2GhES9tQH+TOn1dB16g@mail.gmail.com>
Subject: OMAP3-RNG and rng-tools
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Does the OMAP3-RNG work with modern implementations of the rng tools?

I noticed that it takes long time for crng init to complete.  I
installed the rng-tools hoping to speed things along, but it seems to
take a long time for the crng inito to complete (80 seconds)

[   80.799011] random: crng init done
[   80.802459] random: 2 urandom warning(s) missed due to ratelimiting

I've done similar stuff on an unrelated platform, and the i.MX6 RNG
stuff appears to work just fine.  I have tried installing the
omap3-rng stuff into the kernel and as modules, but it doesn't appear
to be making any difference.

adam

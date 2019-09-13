Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 008FCB270E
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 23:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730990AbfIMVMI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 17:12:08 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:45768 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730847AbfIMVMH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 17:12:07 -0400
Received: by mail-io1-f49.google.com with SMTP id f12so65613904iog.12
        for <linux-omap@vger.kernel.org>; Fri, 13 Sep 2019 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=a6ZwjFOv3YTvkjOT3yfO2TAbDn6iOWuNpM7byTKyigY=;
        b=nxRRhkgp0zUTiCywxVQTPaNMVlmhZgjrOvAHNXzF9fMpCaspVQG6hZOrKgpH9pP/Td
         pUL294PAclqEt1pIs8yHDRZXLg76zxyTI2GAnwl/jRKqorFdMKvzowzbsRSbzRMyWhsF
         s9pBzWcGmqn0ISCoscYSTX+wJMeeJcHDuxlF0UThbDuLmfnHTSLPZjdYR8B5+fcHLtDM
         kROgwy5lOctrB83FIYg5uWnLfqBCkZJ3s39//9y9+/1kgOu7oulzdr/W/31GRwwq1UqD
         T8cRsR9OrQYku/sOz110AcszoWskPD5Bvh2peyDcyZFn3+OAE2DKJuo0bLhvNeg3RmEi
         N1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a6ZwjFOv3YTvkjOT3yfO2TAbDn6iOWuNpM7byTKyigY=;
        b=UhmA5niIegDqJnmpjJmR4+IMenZ0ja2fBO1T9zcXkoEHNUBTywYQTaxqPrhtCuYGwX
         9hyJ+IHiOzsmYpkg+pyrFZfuniOZhjQYMJQwRPwhbVHS2i8vYN2CvQTjARW2XYquFMMW
         81MyJN5YLvyHmI7e+J9sfh1kvZ49fzS9v7BbWf1xC0f6wcOrXl8u/Y+Hcbg6OHakR2ku
         LyyvQRaXHhHeBvK20kmadxkj9N/+pDV5q08ki/1pPWQRja9ZQcT+4yz6H1pVvzakMJVb
         I0OYr9cUBlNyguyUQV5mW2Kjqg1u98NRLf2wTFjd+rhmjdRG2rhpjzXeG/6ME2uqJBlT
         rxOw==
X-Gm-Message-State: APjAAAWOxlvbWRLTLKyXA4llcMg4EtomnFyBsBGxblCxy3wu1kvK2Q+o
        2dfwTD31n/s9txuqjN3R5WL+wsfez0ZmQXzIoFI=
X-Google-Smtp-Source: APXvYqzj5zyUKxUA3nKwYsatBVEQr28u9l1Qn3Lkg9KpbymVc8BTeqQd9xyWIZGkQDbLZOnVrL4E1kE+BKVHoUFPVk0=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr2342964iog.78.1568409126838;
 Fri, 13 Sep 2019 14:12:06 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 16:11:55 -0500
Message-ID: <CAHCN7xJZk-7+6=13arKHdTkNoEANeZr2hUZu+AbDzw5m9vQLWQ@mail.gmail.com>
Subject: [RFC v2] ARM: dts: omap36xx: Enable thermal throttling
To:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,

Go ahead and discard both the original and v2 of this.  Based on
feedback from others, it seems like the other series I did which
configured the temp sensor for all omap3 should be sufficient.

Once there has been enough time for people to review the other RFC,
I'll resubmit with a more proper patch giving some of the credit to
Nikolaus for convincing me to do this.

adam

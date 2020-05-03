Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AD31C2DA7
	for <lists+linux-omap@lfdr.de>; Sun,  3 May 2020 17:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgECPs0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 3 May 2020 11:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgECPs0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 3 May 2020 11:48:26 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE93C061A0E
        for <linux-omap@vger.kernel.org>; Sun,  3 May 2020 08:48:24 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id u11so9783499iow.4
        for <linux-omap@vger.kernel.org>; Sun, 03 May 2020 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZWxwpaihV9URhH8dfTEUpEMqgFhP8G20u7+KuQ/c+jc=;
        b=bf4E0PbmdPHYIkqTxDshd4Vds1iiZlovJvDx3lhPfam7Hka3JnGNlUEI1M5t/v0pZs
         uxtQfFzzSTjnSUl7OCZbEcaD+3NRU+PPM1xvBM25TzgKrg5nNtYsNzhCnoyoQXZ2gWGb
         bQEX876RuTdLxvA9cCBq81VZDjfaEKwviOH2jZ/SgQcIsue+ScYyK0VWSCVw/cWCcQ9S
         FaWwwnUeUDgBL/Ibd9UwcPd5byQyfPjXPst/ka2rjvIA9fIgsPfWgvWnSOsl8Q0qFtJj
         2kJZypKvoARaxIEKepB9ogDMaY/Y42XX9VZeiUGpTbwgY2f06IVTsnnnMfcAJ3QNRJaM
         lc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ZWxwpaihV9URhH8dfTEUpEMqgFhP8G20u7+KuQ/c+jc=;
        b=LsUQcqyxo8RcuniE82/wLR9LVT0mJb7dSt1UBYrHJT3Wm2fHcZ+YeuU2iP4tNrOoo+
         co8XdV6wxDUlgQkNYcsVv0iRXQMkpH4PoCu/oscX89EGbSsU6GJFJj+MRH8uKmE0QNwb
         EjvLyDvOjJsqVHgfmqsDMeSLkuj1uSY5b/ullc8cc/RBZpQGBKpclp0Xxse842XJ/ahh
         cv98d7mjsahrxn5NNPZSPWDYxC6iQeeVtNow7uqpBUJhzMteGHm8zCSVypSC9gUlCWLb
         TtlSKT9G2vGeFQZ7YZbUrFegdZucZOoAHMV2h23FD0PH282/eMb0jHFH3/Z92FkEuexm
         AIZA==
X-Gm-Message-State: AGi0PuaATfM6GFR/mYJ1MqyggQbmM/j9UVmaDHz2kAo4TlRc7AH5GRuF
        CPb7msx42dnkllA70sdAyu3n0NfGpJgjQ2B0Xq8ziuN8QRTvfQ==
X-Google-Smtp-Source: APiQypJmHpS1wDADmoD13I7HJP6bmcQpuPdpmW51i7m7obZdUAsn0NkOr7quKpy/CY7K0QeiPIHVatBQA9MO3RpNRHg=
X-Received: by 2002:a5e:8203:: with SMTP id l3mr8762611iom.35.1588520903646;
 Sun, 03 May 2020 08:48:23 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 3 May 2020 10:48:12 -0500
Message-ID: <CAHCN7xKe6DbNtjWzvXWFO4KMkvmmyaDDFnDWuMOKXi7B5CwJvA@mail.gmail.com>
Subject: OMAP36 AES and SHA addresses and hwmods
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

According to the dm3730 reference manual, there are supposed to be two
AES and SHA engines, but the addresses of their IP doesn't appear in
the reference manual.

The AM35xx has references to two memory locations for each:

   AES1 shows it's at 0x480A 6000
   AES2 shows is 0x480C 5000 (matches omap3630 entry)

   SHA1MD5 2 shows it's at 480c 3000 (matches omap3630 entry)
   SHA2MD5 shows it's at 0x480A 4000

Is it reasonable to think the other IP block addresses for the
am3630/dm3730 would match the am35xx?

Currently in the OMAP3630, there are hwmods setup for AES and SHA
engines, but the rng uses the newer approach with ti,sysc and
sysc-omap2.

I tried to just copy the existing blocks to the other addresses, but I
got some errors. I assume it's due to hwmods.  It seems like we should
be able to convert the hwmods out, and add the additional addresses
for the omap36, but before I go too far, I want to know if it'll even
be possible.

thanks

adam

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F4E927CA
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 17:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfHSPA2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 11:00:28 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35553 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfHSPA1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 11:00:27 -0400
Received: by mail-pl1-f195.google.com with SMTP id gn20so1097583plb.2
        for <linux-omap@vger.kernel.org>; Mon, 19 Aug 2019 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=4/ly6HPt9MuSlzZVKb1ZNAGpaR6hbnk1w3F3lAizCZ4=;
        b=Ar9Jrh4n+AxhKzP3E82xxRgt2f+w/m6g4fAd6hwOBXEa8l/QrnLpoN4L7C069Hg8BB
         vZXE0fAQBBbJSjdU1n9SB8DFoICNk7mMyUqKzimsj0zdlhkBe8Kx5T0EmHMPBgP0ATMz
         AUCmp8VYtXTTfsME6UtuwQdb7Xqhdy6Kf5RQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=4/ly6HPt9MuSlzZVKb1ZNAGpaR6hbnk1w3F3lAizCZ4=;
        b=GizqV3BC5io5dY1Yw/zbgkbHgcke8U951OTEogq+XSPjyFE5Zg5wN3OECwUb6VO1K1
         RbkC90xgLmP9/F0dJGGWd2AhUKGB26NCCh40+KOa2dr76yisumr03ByyXv1qVfwgtpYE
         CE0hi638uiezZufV+6hJXHPAbYfvSyejW3O9hKZRDEfzHcqiywu5WkvmJn1CEa0pUzzP
         SJN89bXq26X8ExAuefCx5uRVBT+GUpIYq3HMMdytLh5f90+1atjeLQMKARSr+9noVONK
         hYlmkvuIm4GlUyuPC4DSn3GDNy7LqcJk67e+eamT9Ehlzr7IL8/CZBRd5Pivy5jOS2Oy
         6y5g==
X-Gm-Message-State: APjAAAVUS566wKtXIUSNAnMSPRCc+8oUykbqvo9z8Vc25BQMlP6gMCdN
        GviK9elFSf5RI1X9UraViVrVz2aOiVFJlQ==
X-Google-Smtp-Source: APXvYqwWSSEhuqR8SWJi61MDpoeQJR8uCtSX1ClwlPzGOBoOLAQPhjydycFVO+27j6jBePK611onXA==
X-Received: by 2002:a17:902:20e3:: with SMTP id v32mr21840810plg.142.1566226826298;
        Mon, 19 Aug 2019 08:00:26 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id t9sm18324720pgj.89.2019.08.19.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 08:00:25 -0700 (PDT)
Message-ID: <5d5ab989.1c69fb81.6c07e.bcce@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b0678bfc-05ae-99b4-5b24-5c813efe718d@ti.com>
References: <49fc7c64-88c0-74d0-2cb3-07986490941d@ti.com> <5d5a4150.1c69fb81.3faa2.eee8@mx.google.com> <b0678bfc-05ae-99b4-5b24-5c813efe718d@ti.com>
Subject: Re: Suspend/Resume Broken on AM43/AM33 Platforms
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Kristo, Tero" <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>
To:     Keerthy <j-keerthy@ti.com>, Tony Lindgren <tony@atomide.com>,
        herbert@gondor.apana.org.au
User-Agent: alot/0.8.1
Date:   Mon, 19 Aug 2019 08:00:24 -0700
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Keerthy (2019-08-19 00:27:13)
>=20
>=20
> On 19/08/19 11:57 AM, Stephen Boyd wrote:
> > Quoting Keerthy (2019-08-18 21:24:58)
> >> Hi Stephen,
> >>
> >> commit 03a3bb7ae63150230c5de645dc95e673ebf17e1a
> >> Author: Stephen Boyd <swboyd@chromium.org>
> >> Date:   Mon Aug 5 16:32:41 2019 -0700
> >>
> >>       hwrng: core - Freeze khwrng thread during suspend
> >>
> >> Commit seems to be breaking suspend/resume on TI AM43/AM33 platforms.
> >>
> >>
> >> rtcwake: wakeup from "mem" using /dev/rtc0 at Sun Nov 18 02:12:12 2018
> >> [   54.033833] PM: suspend entry (deep)
> >> [   54.037741] Filesystems sync: 0.000 seconds
> >> [   54.062730] Freezing user space processes ... (elapsed 0.001 second=
s)
> >> done.
> >> [   54.071313] OOM killer disabled.
> >> [   54.074572] Freezing remaining freezable tasks ...
> >> [   74.083121] Freezing of tasks failed after 20.003 seconds (1 tasks
> >> refusing to freeze, wq_busy=3D0):
> >> [   74.092257] hwrng           R  running task        0   289      2
> >> 0x00000020
> >> [   74.099511] [<c08c64c4>] (__schedule) from [<c08c6a10>]
> >> (schedule+0x3c/0xc0)
> >> [   74.106720] [<c08c6a10>] (schedule) from [<c05dbd8c>]
> >> (add_hwgenerator_randomness+0xb0/0x100)
> >> [   74.115358] [<c05dbd8c>] (add_hwgenerator_randomness) from
> >> [<bf1803c8>] (hwrng_fillfn+0xc0/0x14c [rng_core])
> >=20
> > Thanks for the report. I suspect we need to check for freezer in
> > add_hwgenerator_randomness(). I find it odd that there's another caller
> > of add_hwgenerator_randomness(), but maybe the ath9k driver can be
> > converted to some sort of hwrng driver instead of calling into the
> > kthread directly.
> >=20
> > Anyway, can you try this patch?
>=20
> I applied the below patch on top of latest next branch.
>=20
> Fixes the issue.
>=20

Cool thanks. I'll send an official patch now.


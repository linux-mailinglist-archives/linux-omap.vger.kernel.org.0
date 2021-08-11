Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D48C3E91F8
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 14:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhHKMyq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Aug 2021 08:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhHKMyq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Aug 2021 08:54:46 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027E9C061765
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 05:54:23 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id a8so3206327pjk.4
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=G5XDF0Yaeq/aoKslFJ82JM45zkOaxv7CSOIrzeYMj68=;
        b=LcKqry7phgW7YlwSvzcQkvLliZX1dcN7Pmks9GFhqPUVs9EFMv/n/ON2XZ94LFoeMv
         1f7rr5J8x+U8AGxF+H4LLTBaj2eZ6AUT3uSfHtsFb6rbvZwEcI5yeNT/cOD8ftxPEIen
         e2dw1OeclspRXRwPpFfwLEqXG6auDgi+JapCQtdCspZ9FDwfw1clWnw+PFBv9Rhxc9iq
         lsaidmgjA1POj44NM++a67woGSVsvCTr62ZU71VuJFjENMoc3dsAPpZFfUiH9q8Up89k
         EEPuz+T0TJsaOOiY9XWiKPuIN6tmeqWKrfzdJPal0dlo3E0Z2f6jRsY2m8lAMaODV5Dr
         2ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=G5XDF0Yaeq/aoKslFJ82JM45zkOaxv7CSOIrzeYMj68=;
        b=ttLW9ryR2D9fLr1pnqPLl5kvu4B5I1E0rE0f0S6gjIg8xqj1MIbGM0+zo1PQu4TjL1
         /asJgvzBcMmRE0Eu9cR5eCp72iq7MQ9wJgQspcv7yGz+mie2XsblqDEU5LuXi4z9Dsr7
         +rge0bOUhZ7yMmAOCXO0kI8jLhbcdJgvUVGFy0GQu+Crrnx1bKprNb4l6VbKKUonr8Fl
         jzDv5rWewldz7zv9quSU9XGSsWHhLFfQrfYmBCEyoTVuTAeql8z7eMxNZKizJcmygADj
         2iXFineJQqlo2FfvrimLNDlX0+mjVZVzovP6LWzNBWlMg9HuN9euaBVqHbasbiMA/85E
         JiwQ==
X-Gm-Message-State: AOAM533ZQBkGZHEsRaCE8uG+9bFe5WMKAPa9SJXqkrZF28cZ1ZnFDFjc
        mOe940k8uHH3W0Q5zr+X9jyKMmRUEqmm0A==
X-Google-Smtp-Source: ABdhPJz3og/D+Oq8UdDjxNoHz0anGyDu3pykaHR+OZHaKf/vLOKyWTmkE+0uPJt9eLBSQ4qyC4mf/g==
X-Received: by 2002:a17:90a:8b07:: with SMTP id y7mr10593977pjn.30.1628686462417;
        Wed, 11 Aug 2021 05:54:22 -0700 (PDT)
Received: from ?IPv6:2600:8800:6880:151:5100:428e:ac50:3e8a? ([2600:8800:6880:151:5100:428e:ac50:3e8a])
        by smtp.gmail.com with ESMTPSA id u19sm24863773pfg.42.2021.08.11.05.54.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Aug 2021 05:54:21 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
From:   David Russell <david.russell73@gmail.com>
In-Reply-To: <YMBdt8dDdvySofuC@atomide.com>
Date:   Wed, 11 Aug 2021 05:54:20 -0700
Cc:     "Woodruff, Richard" <r-woodruff2@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B1CE4CB-689F-4547-A64C-A7FB699F0730@gmail.com>
References: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
 <cb562f9f798d4431a09f19e8efd24727@ti.com> <YMBdt8dDdvySofuC@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Good Morning,

I have been upgrading a legacy project that runs on an OMAP2430 based on =
the linux-omap repo (tag v2.6.28-omap1) to mainline v5.10; I have been =
able to get the main application running, however I am concerned there =
are potentially many underlying issues I have not corrected nor even =
seen yet.  I recalled Tony=E2=80=99s comment that the part is dated (of =
course there is no argument from me there) to the point that I am not =
sure to what extent anyone has used the latest mainline on an OMAP2xxx =
part (i.e., regression testing).

I am hopeful someone has a good suggestion to the following question:  =
what mainline kernel version would be considered the most stable in =
regards to an OMAP2430 processor that may also include the TI WL18xx =
wifi driver?  Or if they do not overlap, simply what is the latest =
mainline kernel version that would be most stable for OMAP2xxx?  I am =
just afraid the v5.10 and v4.19 are so new that there are underlying =
issues that would take significant time to chase down; but if I can =
roll-back to an older version (yet newer than 2.6.28), that might get me =
closer to where I need to be.

Thanks for any suggestions,

Dave

> On Jun 8, 2021, at 11:20 PM, Tony Lindgren <tony@atomide.com> wrote:
>=20
> Hi,
>=20
> * Woodruff, Richard <r-woodruff2@ti.com> [210607 15:40]:
>> Guess: this bit in JTAG script used for IVA tests probably is missing =
and needs to be worked in.  The generic linux-omap clock code probably =
handles the IVA clock but maybe not the resets.
>>=20
>>   /*  Enable IVA-ss functional clock (set bit 0) */
>>   (*(int*)0x49006800) |=3D 0x1;
>>=20
>>   /* Release l3s_idle_req  */
>>   (*(int*)0x49006810) |=3D (1 << 1);
>>=20
>>   /* Release L3S reset and power-on reset (clear bit 1) at the same =
time */
>>   (*(int*)0x49006850) &=3D ~(( 1 << 1));
>=20
> Heh and I thought nobody is using 2430 any longer :)
>=20
> FYI, the current mainline kernel actually can deal with all that using
> reset driver and genpd, see for example commits:
>=20
> ae57d1558908 ("ARM: dts: Configure interconnect target module for dra7 =
iva")
> effe89e40037 ("soc: ti: omap-prm: Fix occasional abort on reset =
deassert for dra7 iva")
>=20
> Similar setup should also work for 2430 but needs the power domains
> configured for drivers/soc/ti/omap_prm.c at least for iva.
>=20
> David, I think what you're seeing is iva getting released from reset =
with
> an unconfigured MMU, and then the system will hang.
>=20
> Regards,
>=20
> Tony


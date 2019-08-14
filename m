Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD4638DFC1
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 23:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbfHNV2X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 17:28:23 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:40223 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbfHNV2W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 17:28:22 -0400
Received: by mail-ed1-f50.google.com with SMTP id h8so491162edv.7
        for <linux-omap@vger.kernel.org>; Wed, 14 Aug 2019 14:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rT0Oekm2S2CyxNrnNrNnLaGXXJr1ok3bb8/eXTAWAKE=;
        b=cIBVtTFpewpqFfJP0Kevl8Z8XI20SDw3zDo/8WxankhQZmPxW+yq91ifxPGxUBl9yW
         F15jMtDgrDtw9pQMRE3Zky6bz1m2XpA3zYbLxHpp7iQC+nFIlC3R0Ihq+3U46y8iL5WS
         dMDTNQPuKDBQagN/4j9FLidyQWc6S4Bd9g2DF5KZh+itAscH0Q6QwqFlxzTPGcnOFb/B
         G0blhW+OnRReT3J8yJtI+FKCFwgpZW492iOeUmve/Vqmsn5TJQBOKzPOnTl6Q7z7kSJR
         RHKaHH2r7s5YBC/Ecm/FHaMhy1xmm8MmcyHY4wi98kmYOoyHAyZKRk84tiXvK1dVKEmh
         JmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rT0Oekm2S2CyxNrnNrNnLaGXXJr1ok3bb8/eXTAWAKE=;
        b=AXS/oaydhmS9lOdjSyYIyiNmxUNGyGgnnoxiCa/EuXdjXH8Ep2ymWtReG7T1yXEMbX
         9rFed+WWpzzQ09n11GsERgRo42Bp3EumBixHP2sjiDpr2SlmZK+3bOgmnurcqrAr2vF0
         DIVFb6cYFaLb9XETIVFaiBi4DcZ6Uz9I7PtbsdPMA36jvMAecfbc5tWj4W4uQnpKV6Ov
         IJ/uw2ffvfLnDJfgwF6oOLlSFQ8MdMEr6lxJm+VZ4aMTYOM29KN8YLYE9V5niHFbB7ss
         sdjCQdP7kxsry7MDkZZWAp5k43j6o5jym4NcC4zZcKolL2rpzikOhVFZ8UpYShKJ2oSk
         6lVA==
X-Gm-Message-State: APjAAAXE5HrXZcpFqk42xBacHR87+qBBX5alLSb5tkDLQ36lBbke+3PL
        1HJzEkE3NliqkPrgGT6Ti9HDrd5h
X-Google-Smtp-Source: APXvYqzAFc3Uu+qxa1dPZbvs0eb9dpuNgQI0owBc19BemnM5Y7rMdyJZCgs43ZZX2LWXQ/59xhfRFA==
X-Received: by 2002:aa7:c586:: with SMTP id g6mr1900285edq.298.1565818100930;
        Wed, 14 Aug 2019 14:28:20 -0700 (PDT)
Received: from lepton (46.137.104.92.dynamic.wline.res.cust.swisscom.ch. [92.104.137.46])
        by smtp.gmail.com with ESMTPSA id u8sm170208edo.78.2019.08.14.14.28.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 14:28:19 -0700 (PDT)
Date:   Wed, 14 Aug 2019 23:28:16 +0200
From:   =?UTF-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: omap36
Message-ID: <20190814232816.4906f903@lepton>
In-Reply-To: <CAHCN7xJXJ__Gm3x=eAKkXuRTi1tDJocddKUzSw8oeYXQzM4tuQ@mail.gmail.com>
References: <CAHCN7xJXJ__Gm3x=eAKkXuRTi1tDJocddKUzSw8oeYXQzM4tuQ@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Adam,

> The Logic PD Torpedo dm3730 boots with a few messages that concern me:
> 
> [    2.824188] omap2_set_init_voltage: unable to find boot up OPP for
> vdd_mpu_iva
> [    2.831481] omap2_set_init_voltage: unable to set vdd_mpu_iva
> [    2.837280] omap2_set_init_voltage: unable to find boot up OPP for vdd_core
> [    2.844329] omap2_set_init_voltage: unable to set vdd_core

I noticed the same on my dm3730 and found that the order in which TWL,
SmartReflex and the omap init functions are called was wrong.

See my patch set here:
https://marc.info/?l=linux-omap&m=156462291906717&w=2

With this I was able to get rid of half of those messages...

> I noticed that abb_mpu_iva has a bunch of OPP's, but it's not clear to
> me how or what should power this and/or how the regulator is is
> related (if at all)

It seems to be more complex than I assumed. In short, proper Dynamic
voltage and frequency scaling (DVFS) is required, which is currently not implemented.

> The torpedo is using the TWL4030 PMIC, and I would expect those
> voltages to be acceptable to the twl4030

I found one patch [1] which enables SmartReflex on the twl4030, which
this dm3730 ran without RAM errors at 1GHz. 

However, I have learned that these patches are not enough, and would
reduce the chips lifetime without DVFS active.

Kind Regards,

 André

[1] https://marc.info/?l=linux-omap&m=156462292206718&w=2

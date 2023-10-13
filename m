Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8D77C87BB
	for <lists+linux-omap@lfdr.de>; Fri, 13 Oct 2023 16:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjJMOVO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Oct 2023 10:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjJMOVN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Oct 2023 10:21:13 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADEB95
        for <linux-omap@vger.kernel.org>; Fri, 13 Oct 2023 07:21:11 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-565334377d0so1600213a12.2
        for <linux-omap@vger.kernel.org>; Fri, 13 Oct 2023 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697206870; x=1697811670; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFekfBOaKMjW3ccjlw04ZAIQuYZsrqobQHcUnFAZGHY=;
        b=CeE2Mg5ocn8aG264CCcTcvuwZWVbfRaclv0hlxo6AgXKJZEqhvI7RgB8FpCFgaczDb
         WLh0jfr97z6RpqEBP6ZZa6FC7XQKo4x3Ex6NqjZIA3DUZ6UXG9OC0PxhETVEjld8N+hE
         xzb+UwXs6hPG9/wq9kgx4dfOGETwVIQpo6CMAoYlFIoeCC108XFFLgtnZXq+uO/7SnoA
         zB/KE1YMQr14HsBybj6eK0D4gghI6FTGhfHZN99bV/eQTxNY46fqytiKMkgg0hbDeyPR
         MpRK4ewXieO169pZVLbeRXkEXl9at2wZPAVMWfqjVNLIQkxv1J+anEsAZTVB40QZRZky
         QeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206870; x=1697811670;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFekfBOaKMjW3ccjlw04ZAIQuYZsrqobQHcUnFAZGHY=;
        b=AV8yh+YM9P5tK98iYAUl3ppCqxWbWw1UA9cZaIBlZGTsaGr94SBgJwi2R3NghwLNbi
         G1tSl7fdGCpSHlhYqduIeQF9Cn+s1IjqjzdEniCzqfwjnHe5rWgYGvoO3o8DwI64U3v8
         Hoi6ynvexK2QkKzrX2k5q0U31x0G/SlFR1huG7Cx3rAxHB/eKvajKsKGx1g5GzQxePg/
         yccp96nZ+C8KciRLpiXU4NwF51tWPlfwCMZ+3E5y8o0+9Q+A9VVUCKxe1XWlmmjBqs7G
         59enYUiNINTNepraJE6q4So3DDq4YrsA5UHCXfj8rOJiNeiv+fC7Hu2g5YYPqP8mHWpY
         lPIg==
X-Gm-Message-State: AOJu0YwAO6nP+vthxlJvS2zQ0iCz7s825z+UrwJ+XmvUj4gH9F4bajCl
        cX2omOs/bA6zxrjXHYoBUUda84hodobY/a3dDrWFQWar
X-Google-Smtp-Source: AGHT+IEUVM2U+0AmBZDSXZQZ/t2i9QFw8BKoIdUQraacvCr6bIbC2iGj6+HMo5kqXTow5zsHWtWf+gSxyFNxvrL+bVA=
X-Received: by 2002:a05:6a21:339d:b0:16b:c20d:fcd1 with SMTP id
 yy29-20020a056a21339d00b0016bc20dfcd1mr26064316pzb.21.1697206870306; Fri, 13
 Oct 2023 07:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJzt+d-azD4NrXj4RKpYL+v0pYQC9C8F-hgxcritJxWUA@mail.gmail.com>
In-Reply-To: <CAHCN7xJzt+d-azD4NrXj4RKpYL+v0pYQC9C8F-hgxcritJxWUA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Oct 2023 09:20:59 -0500
Message-ID: <CAHCN7x+ny+ZAFAaAqG2Spd4==mqbsNOTjmJPdkoYph6pa=bbAA@mail.gmail.com>
Subject: Re: OMAP3 HSUSB EHCI External hub disconnect failure
To:     Linux-OMAP <linux-omap@vger.kernel.org>, lee@kernel.org,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 12, 2023 at 3:50=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> I have an AM3517 and it's using the ti,ehci-omap driver to control a
> HS USB port.
>
> I can connect and disconnect multiple devices without issue, but if I
> connect and disconnect an external USB hub, the hub disconnection
> isn't detected, and the USB no longer works when I connect anything.
>
> I was wondering if anyone else has seen this and/or has any
> suggestions on what I can try.  I should note, that I'm seeing this
> ont he 6.1 LTS branch, and I haven't had time to check the latest, but
> this driver is mature, and hasn't undergone any significant changes
> since 6.1.
>
> I also will try an OMAP35 and DM37 connected the same way to see if
> the problem persists on those platforms.

I tested a DM3730, and it also appears to not detect the removal of a
hub, but it does detect insertion and removal of thumb drives until
the hub is inserted and dremoved and then no USB insertion/removals
are detected.
>
> thanks for any advice in advance.
>
> adam

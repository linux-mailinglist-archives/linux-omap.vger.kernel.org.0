Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020B71D6F18
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 04:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgERCrV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 May 2020 22:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgERCrU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 May 2020 22:47:20 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B647C061A0C
        for <linux-omap@vger.kernel.org>; Sun, 17 May 2020 19:47:20 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id c20so6234394ilk.6
        for <linux-omap@vger.kernel.org>; Sun, 17 May 2020 19:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=gRnXjjhb3QXi/K8l7JEQWMO2s0UM3aUuW2G+/OyK9fI=;
        b=ZJlYLaZyrjCxtiAENNUMdu2KV4IpDJbbUD+wtLfUyuai9izb9pWhiH/vWI4+/kXmAy
         ncnnH+MJ8wUxYLJB7D7/TdBztAqFcJdCcXfOtocNo0f3gJ3IX26+MT2wMbMf4A4mTGOX
         RCbF+YrJXavnZ4uHGzSWcH5qri0ZkOLQiT/ry9wRcFvoBQWZf1i+752gaxbhmpjewPpr
         ssgDqEQnzfAN9uEoN3EjB3Iue1EqejWOOm7nnUYtrj7VyLawDqL8evTc7+M7KWostoKM
         j7GAhL/Bj2uzxnTFiVapDVEaptVefhl01JyYdOeX37KRF+sK6t+U9xEnzN8M1iUCfpOj
         3w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=gRnXjjhb3QXi/K8l7JEQWMO2s0UM3aUuW2G+/OyK9fI=;
        b=oH9PvFaHVtOHpZG51rxePcqjx2XEhllSDyHu147lCVbmSw3sQVoGKcVUo1ZUa9XKsh
         hehJCrq0wrOM5QnoBhpOv2VlSodPJiGagzGKRkUAJbaml4lfjUBOThr7F4IPTc4jMJ/+
         297CxVlqmOxWuNAa64dAvITkUPDOHz98ZoM9qUNS11pQ6of3UlzQBOR8A13Q7d6Ambt4
         hEOWUH/OAXKiVZ4hY+oaF2Gd+E7J5rwQTonXbTrpADtqM/LtFoVxOumjJr0lY7cto3Q8
         LgWvj+AHzP8e0419ya3aUsrEkxgNDDfCvKIV5QcdYJwv8wc7SU9Z9F+D6ufE2ly/wHiQ
         aYpg==
X-Gm-Message-State: AOAM531wjZqXU+0qSjPyn63B2NRmwOU2U2I5he5RUlAhLzfiOd0VPBui
        9dAF5p39QLsWywKJaLNH7gg0487CD/Ze2s+VNV8kb30UAJg=
X-Google-Smtp-Source: ABdhPJyoVU3zpvNbnD9mDJQQz57F1OuDiEVFWkGdQjwQ75OtHd1O8jlBt3FhQm/364XD3KjvNtrDy8LTOfkGbaJ0p4w=
X-Received: by 2002:a92:502:: with SMTP id q2mr14080699ile.89.1589770039492;
 Sun, 17 May 2020 19:47:19 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 17 May 2020 21:47:08 -0500
Message-ID: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
Subject: AM3517 MUSB and CPPI
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From what I can tell, the MUSB controller on the AM3517 hasn't worked
in a very long time.

I have been going through the TRM for the AM3517, and I am convinced
the device tree for the OTG port is wrong, but I am struggling to fix
it.

From what I can see the USB OTG Port support the CPPI 4.1 DMA
controller, but the CPPI 4.1 only appears to support the
DA850/OMAP-L138 and the AM335x family.

It appears as if the AM35xx is a bit closer in behavior to the AM335x
than the L138, but I was hoping either Tony, Tero or someone from TI
might have a suggestion.

The compatible flag need to be something like "compatible =
"ti,am35xx-musb" and not omap3, because OMAP3 doesn't support the CPPI
4.1 DMA controller and the AM3517 does.

Secondly, we need to update a couple of the tables in the cppi driver
to support the am3517, and lastly, the device tree node needs to
support the CPPI driver.

It looks like the DA850/L138 makes the CPPI driver a sub-node of the
OTG port, while the am335x has it as a separate node from the USB
controller.

From what I can tell on the AM3517, the CPPI DMA node should be a
sub-node of the OTG.

What I am struggling with now is the register offsets for controller,
scheduler and queue manager.
On both DA850 the 335x, there is an explicit table entry showing the
offset of DMAREVID, which tells the DMA revision ID.  I cannot find a
corresponding register for the AM3517, yet the AM3517

FWICT, the scheduler is offset 0x2000 with respect to the OTG
controller, and the Queue Manager register is at 0ffset 0x4000, both
with respect to the OTG base address.  Unfortunately, I am not finding
the offset for the CDMA controller itself.

Can someone tell me what it should be?  I am guessing it would be near
the 0x1000 offset, but it's a pure guess.

adam

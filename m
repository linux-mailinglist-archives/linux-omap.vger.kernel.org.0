Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B4CC2248
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 15:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731043AbfI3NjB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 09:39:01 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:32100 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3NjB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 09:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569850738;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/cU1GThaHWVMVBPXz7oa2Qdh8Oy/K7aL/RC4Cd4MOGc=;
        b=eLrsf/U6eQR8Mi0M55p9b4d4SPzDz+ZHp3mdhhqgEGheD6v/mEIX1i8ghDEkMHc1+i
        oS3eRZbzyPLNnWygfTa+HtbgOauJdLjbPg0dxi604gJ04BISd8dEyLZRk/mLptBgz8RN
        mvW89TQhDAk83lu3qw0MOZvCgpfjiTNP4uHf/1GqhJOyRKndRWMSeNzSmLSNfeNUYiOW
        cY/vzvPdtMcMQPuRJCZ8tozpBfgcHhX+RsORLVWUpOK7er3Q13uY9RP8oJqkhude+q1x
        XNjwc3vBqJNBDMUa6bP+jLexY9aiQbzOZBRwdXVqLdkTlGgbqmurkubaTaplf94+Ghx1
        xcWg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaZXA0Ji18="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v8UDcpSJN
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 30 Sep 2019 15:38:51 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
Date:   Mon, 30 Sep 2019 15:38:51 +0200
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Adam Ford <aford173@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com> <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com> <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com> <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com> <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com> <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com> <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com> <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com> <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
To:     Tero Kristo <t-kristo@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 30.09.2019 um 10:53 schrieb Tero Kristo <t-kristo@ti.com>:
>=20
> The best action here is probably to drop the max-div value for this =
clock to 16. Can someone check this with their display setup and see =
what happens? Attached patch should do the trick.

I have checked on GTA04 and OpenPandora (DM3730 resp. OMAP3430) and did =
not notice a negative effect.

(Well, we never see the problem that is discussed here and have built =
with CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=3D0).

BR,
Nikolaus


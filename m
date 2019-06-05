Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A89235888
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 10:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfFEIb3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 04:31:29 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:16667 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFEIb3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 04:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559723486;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dZ9VB0L69XNhmbi+WvDL/Ge3RPtwyO9V5uIsQMIewxA=;
        b=EUIbujJOnzJTzyH0kT4jnfrzwR5L/nSqeqt9wK3L8UbvLx9G4Fkxf5PnKNn2ps1+0j
        xUzXS6gmNTi6KuI0N0nILfDGzV4EgNuJtMq0nxet4XT/eDIs8YLpcPgh/Lf8cL1Ouk/Q
        JlqqyvRKvQ191pq/ox7ARnAg53bMU4lhQMpyDWS4+2cvcvmh0jccJczHa3Op+qM24BvD
        vevTXWU5tYdamFKWbJ7sobLvY3ZKmBPWzy1nGvyKlLQzeMJUqRvezY9JeUxPu3f7/aP0
        bUEkH5aZA2wiAio3yl5goYKivUxNwPq9ww7NhUzDJ8FKl8+oAuS19pT/C/rgCEwM37fm
        ttrw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vhwDaiCA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v558VNBIo
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Jun 2019 10:31:23 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 0/2] drm/panel-simple: Add panel parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190605082942.GC15169@ravnborg.org>
Date:   Wed, 5 Jun 2019 10:31:22 +0200
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        letux-kernel@openphoenux.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8EB9DF9-3684-4312-86E6-AA7BF38CF121@goldelico.com>
References: <cover.1559711222.git.hns@goldelico.com> <20190605082942.GC15169@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sam,

> Am 05.06.2019 um 10:29 schrieb Sam Ravnborg <sam@ravnborg.org>:
>=20
> Hi Nikolaus.
>=20
> Thanks for the new panel patches.
> On Wed, Jun 05, 2019 at 07:07:01AM +0200, H. Nikolaus Schaller wrote:
>> V2:
>> * fix typo in 99dtc panel compatible string (reported by =
imirkin@alum.mit.edu)
>>=20
>> V1:
>>=20
>> Since v5.2-rc1 OMAP is no longer using a special display driver =
architecture
>> for DPI panels, but uses the general drm/panel/panel-simple.
>>=20
>> So we finally can add SoC independent panel definitions for two panel =
models
>> which we already had worked on quite a while ago (before device tree =
was
>> introduced):
>>=20
>> 	https://patchwork.kernel.org/patch/2851295/
>>=20
>>=20
>>=20
>> H. Nikolaus Schaller (2):
>>  drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
>>  drm/panel: simple: Add Ortustech COM37H3M panel support
>=20
> All three panels are missing binding documentation.
> Please submit binding documentation, in separate patches, with
> proper "dt-bindings: xxx" subjects.
> See Documentation/device-tree/bindings/submitting...

Ah, ok. Yes, will add to v3 asap.

>=20
> Patches not applied due to the missing docs.
> But the patches itself looked good.
> You have specified bus_flags etc, and added the
> new entries in correct alphabetical order etc.
>=20
> 	Sam

BR and thanks,
Nikolaus



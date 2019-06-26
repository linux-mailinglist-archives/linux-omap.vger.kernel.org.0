Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A37056975
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 14:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfFZMlQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Jun 2019 08:41:16 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:17764 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbfFZMlP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Jun 2019 08:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1561552871;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=E23wCGPFOoYgw+3FSRZ9zJVg+DR9nmCJTrte3qyokfc=;
        b=Y8eo5W1ExqUMNngchdOKaTtOYjsKtOryH06WybysFl4JiyGpSGlYBgZcizgdF16xeC
        db2UMaKSjYPEL5kTC3aJmS7bhfb0JGobNMaDj+8zbNiJ7GwoNdNTnHBDymg72irGLNSM
        UIz5k2yJuWp51yuZCz/SzamaT+mtOMD2bdosIffnI3Vs6aveBodvBgDIv5kIpt3giLmQ
        I4DFrd07m4X6SbDr4LOSJOOz7Q+9Wk6kyRiT+WbzbeHSkKVT+KJkFesd4pcZ5/VTHIq1
        gERVn3aXMRuxVJ2fFW4S12AvKJMbOmjlSrUvK2ymxddGoUObOodc5cHmRpzplsiablj4
        GhGg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSUXA0Pfg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id V09459v5QCepbN8
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Jun 2019 14:40:51 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190626073350.GA15288@ravnborg.org>
Date:   Wed, 26 Jun 2019 14:40:50 +0200
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        David Airlie <airlied@linux.ie>, marek.belisko@gmail.com,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        tomi.valkeinen@ti.com, Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com> <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com> <20190625204356.GF18595@ravnborg.org> <20190626073350.GA15288@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sam,

> Am 26.06.2019 um 09:33 schrieb Sam Ravnborg <sam@ravnborg.org>:
>=20
> Hi Nikolaus.
>=20
>>>=20
>>> any progress towards merging this somewhere? It did not yet arrive =
in linux-next.
>>>=20
>>> BTW: should also be applied to 5.2
>> The drm bits are reviewed. The DT bits needs OK from DT people.
>> When we have OK from DT people we can apply them all to =
drm-misc-next.
>=20
> I got OK on irc from Rob to process these.
> All patches are now applied to drm-misc-next.

Thanks for taking care of this!

>=20
> 	Sam

BR,
Nikolaus


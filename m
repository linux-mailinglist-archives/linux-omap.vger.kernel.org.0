Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31272EA1E7
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 17:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfJ3QjY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Oct 2019 12:39:24 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:30140 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfJ3QjY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Oct 2019 12:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1572453562;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Dn40tVbbGhA5NczjSxQCCaGadlXd23pRkpE7OM8NH5A=;
        b=fQ0EYHGnVog07STSSHN1xVxozHHsN1q4avo/yikt4Mxs6niBW/Cdu/5zgLCk+NknRz
        SmNRpolDwU+UIeiqmzeCT+C3pSkjtOO/zj/9G147LyD6NkvbKecOWHn8y3f3K/BV6+SW
        Aoe71lBhAUSOVyfPZ9N/LZq30ueX3+6pqPRy2dYvJC8PXvW/0bfxfUIJaljRVIkoWeKA
        DxRucbYmwLKbIchByJSYqPL8lKXugDik8xh7XqG+iGMmEQrGEAfXlu5XA+IgSB0yB9fy
        Qa4a9MmcRAs7qNT9p9WT1E22l1J04kZ/xRF1MRVCRA4SeSWhEalK3DuDGNQ2Zo07+NQy
        SYaw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCymhdRVSmPRBIbFC67m67z0KUz0RNG8vGE966zI"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2638:1d00:3142:f353:47a0:b4bd]
        by smtp.strato.de (RZmta 44.29.0 AUTH)
        with ESMTPSA id L09db3v9UGdC5Tu
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 30 Oct 2019 17:39:12 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191030161604.GA5610@atomide.com>
Date:   Wed, 30 Oct 2019 17:39:11 +0100
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <61AAD023-6B22-4F81-A3B3-7C9571F967B2@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com> <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com> <20191030161604.GA5610@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 30.10.2019 um 17:16 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [191018 18:47]:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.txt
>> @@ -0,0 +1,76 @@
>> +Imagination PVR/SGX GPU
>> +
>> +Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently =
covered by this binding.
>> +
>> +Required properties:
>> +- compatible:	Should be one of
>> +		"img,sgx530-121", "img,sgx530", =
"ti,omap-omap3-sgx530-121";
>> +		  - BeagleBoard ABC, OpenPandora 600MHz
>> +		"img,sgx530-125", "img,sgx530", =
"ti,omap-omap3-sgx530-125";
>> +		  - BeagleBoard XM, GTA04, OpenPandora 1GHz
>> +		"img,sgx530-125", "img,sgx530", =
"ti,omap-am3517-sgx530-125";
>> +		"img,sgx530-125", "img,sgx530", =
"ti,omap-am335x-sgx530-125";
>> +		  - BeagleBone Black
>> +		"img,sgx540-120", "img,sgx540", =
"ti,omap-omap4-sgx540-120";
>> +		  - Pandaboard (ES)
>> +		"img,sgx544-112", "img,sgx544", =
"ti,omap-omap4-sgx544-112";
>> +		"img,sgx544-116", "img,sgx544", =
"ti,omap-omap5-sgx544-116";
>> +		  - OMAP5 UEVM, Pyra Handheld
>> +		"img,sgx544-116", "img,sgx544", =
"ti,omap-dra7-sgx544-116";
>=20
> FYI, the compatible names above have unnecessary omap in them:
>=20
> "ti,omap-omap3-sgx530-121" should be "ti,omap3-sgx530-121"
> "ti,omap-am335x-sgx530-125" should be "ti,am335x-sgx530-125";
> "ti,omap-dra7-sgx544-116" should be "ti,dra7-sgx544-116"
>=20
> And so on.

Yes,
Rob already noted a while ago and our latest private code has it fixed.

There is no progress towards a v2 since I am still fighting with the new
yaml format he also requested...

BR and thanks,
Nikolaus


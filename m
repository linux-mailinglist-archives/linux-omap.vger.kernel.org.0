Return-Path: <linux-omap+bounces-2715-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58D9D4B49
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 12:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAB921F235E6
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 11:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173631D0F5A;
	Thu, 21 Nov 2024 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="obWdV58D";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="xVGFMzA/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7691E74068;
	Thu, 21 Nov 2024 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732187465; cv=pass; b=qMZgcMT/FiTVg7fpM1PBh2CaVvwTOdtugrxChKmvGR9sIFpR7itQtfuScKuu6Zeo0OefOn6mJOgKA63QRfGDn9fapPvDtyUhLjGnQIA+tmmXMSyUGA5wHkzXZWqYZAlYttwKNKbXj79FNHYnhCC+UJ2wbvYyeuKbruLNM/Ek1QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732187465; c=relaxed/simple;
	bh=qV1PNr2UfaR1SaciS/ifVFdRqOBgeM2CJPSEhhMnHs0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Q9fdoSxfiAWg2DlNJHDuIIQ3FVal3yWPvCQS0gRfNRyZmm5DwGXavks8HJq4WdiX1FkLgYnnb7PgD/GhI/aH50xGPjQ5Tyxu9c0Y55veYxenXhJyH7Op3xPOu+vyK2SebHMc53+sL03s/49y1ZoUQYnJ/hSzok/oCZ+HeMXAe50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=obWdV58D; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=xVGFMzA/; arc=pass smtp.client-ip=81.169.146.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1732186379; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=H1Gg/dojTRosA1FYgkTUvsy5cxFohwVq37tpK/MPPdpep9o98I+J8HwvFhQO6dGaaz
    euTyajMjbrPv0pfNFNls+1bpm58WkLmyrmYyrZLyTgILypdC85tdgKomi6QQ6VAJiy7g
    S+0ytxj/oUHtCd2vMf8EuqKDhKmr29uoCfgf/bmnXU8qIT2ysS4+7kG7jChppkdAS2E6
    ATXMuT3L8asztxIFNsu7Y912LBp4r9327OYsXV4hYDvFxyIKtmPatFeh3MfdjFnOnbcj
    yrafi/qnWoze99wG2eNtnFr532q8eW6+XZ3HDNMFrU+Jb8RMQn9qNyaeeN6nBmXgn3U5
    GEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1732186379;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qV1PNr2UfaR1SaciS/ifVFdRqOBgeM2CJPSEhhMnHs0=;
    b=Ivo4HTrojCTmX7wtJMbKZD079mrSme6CVsC5yEFbj/E3URqZSX37kEN6vxddu9AeFe
    wgp7LWnIf/00PvJeP35+hWBu8bwQLZUL66FlJvyKqyZCNpYm91TzPCmBSGFyMC1ZWHfd
    qlITQxwQTZ8MDF5pFYCweiNVO4dq3vFRH07tEfxYGaKhdO5ILEaUo+pA5rEivtj2tNVn
    UWxaXFBwkLNuUb8yFecy3DtS9VzXH4v3jn1nnH8hBQWcEShnj9NOT/MrZH/yo1+O4Ewm
    H5+orPrGuY5gU9gObe7B4ZJWap8jw62q1DkcIzwXNQi9WenLCuYCawko98QSTP1SMkIh
    wbHA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1732186379;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qV1PNr2UfaR1SaciS/ifVFdRqOBgeM2CJPSEhhMnHs0=;
    b=obWdV58Dfa5/6zHzXItbSrZ/uWE4+rxdn8BVWJ5RzSDzK8kThZw77+4S5RnzF4Mjf2
    AUD4PWDv8VTUwE7SE+cJbHBVNZC9xFFYh80s144BdQ42upmdQ81gPQ6mQbfHF9hEleEG
    6wCh+Bk9Rs7oHvRFj3RdaEq+lk+iuvFq1WowdY8y3/t4fe0YXDcCpIgYbte9QFU6/wxV
    P4kYJD54M5gY2j/OdynzA9h/Ou2MUeL9DCxh4WTwVA6jyOaoCZ3zCpANfFuy/PaOe5My
    ACVZboJsVYc3ZmjIlkwTLxy0S3K5TZzfLzMLQiQspWXXLch/0xyKI1KihTFH9iPeudCL
    CEUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1732186379;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qV1PNr2UfaR1SaciS/ifVFdRqOBgeM2CJPSEhhMnHs0=;
    b=xVGFMzA/t8umI1RObnM6+d3Bz46VQfUJ+5TuVDPmJRDwRK0iCe6oWybR2W/sQ5fx96
    KHtJx3fh1BO7Vf4z2HBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfz8Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
    with ESMTPSA id Qb7e400ALAqwspU
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 21 Nov 2024 11:52:58 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] media: staging: drop omap4iss
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20241121112750.3f5d4d2c@akair>
Date: Thu, 21 Nov 2024 11:52:48 +0100
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <56DA96A4-6CD5-4BB8-9C02-B8B764266DF9@goldelico.com>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
 <20241118200025.3daab676@akair>
 <20241119070222.GX31681@pendragon.ideasonboard.com>
 <20241120085406.4d864c6e@akair>
 <20241120083938.GP12409@pendragon.ideasonboard.com>
 <20241121112750.3f5d4d2c@akair>
To: Andreas Kemnade <andreas@kemnade.info>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi,

> Am 21.11.2024 um 11:27 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> Am Wed, 20 Nov 2024 10:39:38 +0200
> schrieb Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
>=20
>> Hi Andreas,
>>=20
>> On Wed, Nov 20, 2024 at 08:54:06AM +0100, Andreas Kemnade wrote:
>>>=20
>>> Pandaboard camera module? If have a pandaboard I use for reference, =
but
>>> no camera there. =20

Same for me with a PandaES but no camera.

>>=20
>> I used to work on it using a Pandaboard and an MT9P031 camera module,
>> from Leopard Imaging if I recall correctly.

There had been a camera module for the Pandaboard:

=
https://commons.wikimedia.org/wiki/File:E-CAM51_44x_Pandaboard_Camera.jpg

>>=20
> Hmm, that would require also soldering the connector

Seems to be a 30 pin and called J17. Schematics fortunately
shows pin assignment of an up to 4 lane CSI camera:

=
https://web.archive.org/web/20161024203005/http://pandaboard.org/sites/def=
ault/files/board_reference/pandaboard-es-b/panda-es-b-schematic.pdf

And there are some gpios for control.

> and it seems like
> no standard thing, so I would need to create an adaptor. At least I do
> not find anything on ebay which looks like it can be attached to the
> Pandaboard.

ov5640 based camera modules appear to be still available. For example

https://www.e-consystems.com/5MP-MIPI-KameraModul-de.asp

But no documentation about the connector or the adapter board for a
PandaBoard.

Building some adapters isn't a big challenge, but crafting a hardware
design is. And retrofitting the connector (if we know which one was
intended) needs a calm hand + flux (and ideally a microscope).

BR,
Nikolaus=


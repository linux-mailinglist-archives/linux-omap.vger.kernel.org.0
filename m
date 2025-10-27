Return-Path: <linux-omap+bounces-4798-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4BAC11622
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 21:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1F361A619E2
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 20:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124412E54D1;
	Mon, 27 Oct 2025 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqUFY/pf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952B52E6CB8
	for <linux-omap@vger.kernel.org>; Mon, 27 Oct 2025 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761596659; cv=none; b=LKeE6rAB26Q8yLz+SVoyoXazGsJUCFUW5GsCYI4Y1iienmnpl/6biKwJ/7qS5ApwsIUUsWYG8deMRqOHaLzNGhQsKAha/y80Xe4pM1GdOMi5KZPdHvi8i8vmu+MC6mvX5ROSX2P7oNu5gF6VlFrLuWMYMiIOHBY/YgLgqoel7T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761596659; c=relaxed/simple;
	bh=9Z7j6frYiud+8fgLPJNNX2wAipD0uqfxks5QxqPd8+Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dCHTS0+1yv2BYpkXdXNL0KGNfmTpnjeXVU12k84akPJChiy5+4J8CIf5+TCPDfC5bzy+xDleonXPCn6t+zgx3gcmUquYX+vpMMNwYm7tmjzFVYEhbb2lswqBBhdCqinDeZGVdK1E0SSwRIgC7xKpr0rFGSZh4pL9oJa4f5aPSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqUFY/pf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4298b865f84so2812319f8f.3
        for <linux-omap@vger.kernel.org>; Mon, 27 Oct 2025 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761596655; x=1762201455; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sAteg+F5oQJPVS5wX8AGAiIq+FclqksfL+/bVRY3pIY=;
        b=UqUFY/pfNvVLEbCMq7i5sr/4F3Zl7Mvy7NWwxPCZRoLcXaV/TzNNrptitjKqwnyVeP
         KLjIb3iEvsatG+Glnh99/4ROSHW83jy0dt0QEcHdO8/V4RoYiWrMQqdJry13bZ7r8AZv
         htsLU60eG3v9GUkG9zeE8xDg0o7uB3+Df13Bpydpb6NreFXsiPzqmA4OigSNkkML5KSo
         tX6X/kbxkgrwf6O/p0J34JZHJJ/dzE4DUMLPJNssRKj7bpZRFYq5ZUtXSt6Mha6xchyu
         3bs6DvEJqPdByJZ1gm6hgBuZHWCkGQ0pSXhbxWTLBJ4Lk4k5LiQlPqtUA0J/O5s+B6fO
         v1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761596655; x=1762201455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAteg+F5oQJPVS5wX8AGAiIq+FclqksfL+/bVRY3pIY=;
        b=Dgf8hrvKAaSo9lBtHw2c4iGxcErCn/zW8B0OyjDJ+OMVBJPbiWwRuhUIwgK21QOCJP
         OywcBQ2ZhsT5yvJcWeAklI2wTEAFfjTpDZzRYW4tm2hZA0L5f2kC0sfkW2LP560773ET
         CoRmNjdl9T470YyVWC5gRIYgq7F/i8RSP0txksRlNZb0UhrWCKmei4clQ+XCQImBjsuT
         /FXA9oPvg89Q3B+QxtIJmIHKT930/43wwSw0tMmjgHf4T01q0XtAfipf/vEqvBx6Vrcs
         fBxzvIrcaprL1ZEkx5k9+bAPNdV2xurP3IecfChruGZ/VKmfr7lSRfPA5d7vIZymXrrc
         A7kg==
X-Forwarded-Encrypted: i=1; AJvYcCW0sexUN6apElKr1cuQQsHTQwrOilX+wqbuIaZsQLEnz1safVpJV+VDodhoUIGTxwNVtoTN5F9tU0bK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/OupWGQM58WST6fAfKLKs0XW4efXGpzg/wgrPh0FLpCq7jWf
	1H8vhsSt8M+eC7zBPCUOL3E1adrXsHDF9VXBvp1zDc6GlE09AkH9W5kC
X-Gm-Gg: ASbGncv8/B9vWGqur2mhDfwvDWCNgAd8b/SRUizIp4sHCd2vNADvYiVAH9++2Y/giLm
	j9ZbbXTAuGHKIRgVFh4awPcaMvIfJxa3zlMxc5nPHZ8DkRC9iIRUhtg7NxGtPzHzmKeyXpdcpW8
	aDp1Dk0KnTJvdzT8Vlyl2JTiIEu+mt5NiLeiXqxdTu6GSflAXTPWYzp+pLZMVh82lV0vh2N2PF8
	X/uMzOmGdtZWssNmXYMVi465FcDFhKyQkUFC+i+GJS2Je5RTFuUcuNDgh0sGbirF+eyQr1Sqdda
	loTtKsLR2+DluvcD0g+Zj1SnsvH25mnIJU9fgihpohLpSHvD4bzcMfAVVSNVZ+FOAWciIkile5I
	DBTjnrl0iEbI1vM8kxf0R9NuaRsCn0+9T4NlAz5KK3I5/bxtonDYnXkfHmfvB16a5Liz9woQPzO
	AIGr/p++16UsrxqiqGQlUTAVRlWkm8FkC5+A==
X-Google-Smtp-Source: AGHT+IFjSyEOJ8OO9p5enPOa4OY5LYK/YHPQz+HhFO/SNaTbXxhM08eDKEWgk5JuJu6a3RlEJUVVfQ==
X-Received: by 2002:a5d:64e4:0:b0:429:8b44:57b7 with SMTP id ffacd0b85a97d-429a7e844eemr974038f8f.51.1761596654557;
        Mon, 27 Oct 2025 13:24:14 -0700 (PDT)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm173897105e9.1.2025.10.27.13.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:24:13 -0700 (PDT)
Message-ID: <91e8f4346a677a2ea46a210d7422adb99e70b3be.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] PCI: j721e: Add support for optional regulator
 supplies
From: Vitor Soares <ivitro@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli
	 <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
	=?UTF-8?Q?Wilczy=C5=84ski?=
	 <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	 <bhelgaas@google.com>, Vitor Soares <vitor.soares@toradex.com>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 20:24:12 +0000
In-Reply-To: <p3l2p2raecqqkpdjswiddkthpxzvhm3rl4cw56y2epgcxfiwbb@gsieef3yqvpk>
References: <20251014112553.398845-1-ivitro@gmail.com>
	 <20251014112553.398845-3-ivitro@gmail.com>
	 <p3l2p2raecqqkpdjswiddkthpxzvhm3rl4cw56y2epgcxfiwbb@gsieef3yqvpk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello Mani,

Thank you for the feedback.

On Tue, 2025-10-21 at 07:36 +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 14, 2025 at 12:25:49PM +0100, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> >=20
> > Some boards require external regulators to power PCIe endpoints.
> > Add support for optional 1.5V, 3.3V, and 12V supplies, which may be
> > defined in the device tree as vpcie1v5-supply, vpcie3v3-supply, and
> > vpcie12v-supply.
> >=20
> > Use devm_regulator_get_enable_optional() to obtain and enable each
> > supply, so it will be automatically disabled when the driver is
> > removed.
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > ---
> > =C2=A0drivers/pci/controller/cadence/pci-j721e.c | 13 +++++++++++++
> > =C2=A01 file changed, 13 insertions(+)
> >=20
> > diff --git a/drivers/pci/controller/cadence/pci-j721e.c
> > b/drivers/pci/controller/cadence/pci-j721e.c
> > index 5bc5ab20aa6d..f29ce2aef04e 100644
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > @@ -21,6 +21,7 @@
> > =C2=A0#include <linux/platform_device.h>
> > =C2=A0#include <linux/pm_runtime.h>
> > =C2=A0#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > =C2=A0
> > =C2=A0#include "../../pci.h"
> > =C2=A0#include "pcie-cadence.h"
> > @@ -467,6 +468,10 @@ static const struct of_device_id of_j721e_pcie_mat=
ch[]
> > =3D {
> > =C2=A0};
> > =C2=A0MODULE_DEVICE_TABLE(of, of_j721e_pcie_match);
> > =C2=A0
> > +static const char * const j721e_pcie_supplies[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"vpcie12v", "vpcie3v3", "vpc=
ie1v5"
> > +};
>=20
> Please don't hardcode the supplies in driver. The DT binding should make =
sure
> the relevant supplies are passed (including the optional ones). Just use
> of_regulator_bulk_get_all() to acquire all the passed supplies.
>=20
> - Mani
>=20

I checked the bulk regulator APIs as suggested and of_regulator_bulk_get_al=
l()
does handle optional supplies correctly, however it is not a managed functi=
on
and doesn't enable the  regulators automatically.

To use of_regulator_bulk_get_all(), I would need to:
- Manually enable regulators with regulator_bulk_enable()
- Add cleanup/disable logic in remove path
- Handle error cleanup path manually

This would actually make the code more complex and error-prone compared to =
the
current approach using devm_regulator_get_enable_optional(), which provides
managed cleanup and automatic enable for optional supplies.

I also checked devm_regulator_bulk_get_enable(), it treats all supplies as
required and needs the supplies name as well.

Unless there is a devm_regulator_bulk_get_optional_enable() API I'm not awa=
re
of, the current per-supply approach is the standard kernel pattern for this=
 use
case. Would you still prefer the bulk approach despite these limitations?

Best regards,
Vitor Soares





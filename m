Return-Path: <linux-omap+bounces-2521-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F01499B66C3
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 16:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E9D1B23BEF
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 15:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D691F5822;
	Wed, 30 Oct 2024 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2GBuIhe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F28C0B;
	Wed, 30 Oct 2024 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730300434; cv=none; b=AwgdCvMc5uQIHkxPQwNk9OaRsNnCWS4LWNMu9/dJxCawbb851G/ScqFOj01GAZ6vtji4bUWGlCeuk5UH0k6AwRsaKIsrH09JYJBbfv0rq9K3KSVHi9yWOwNAIQ0No25y3n1QSrSyKNm/xO0QG9HsJp1myUSyknXbeIcwEemNTms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730300434; c=relaxed/simple;
	bh=NSUsPKNIcxxIl25/ie9F75hAbipw9DFEqV26/g+9lQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVBzWlgozVD1pev9ne9lM2eCCaKwLBghDe03CIIhURlrXXwBRwNYUsYKqXyPb5v0B0xisTn0PwDfBPL/AZcG0c9tFf9K27odWClTA6uHdNl72i7IsQW1z9qSjoDZOgZuaPmfdW2MgRD/QZawN6cCfaVRNRn4GMY5bCY/wv15t2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2GBuIhe; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4a46d662fccso2250188137.2;
        Wed, 30 Oct 2024 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730300431; x=1730905231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rULvNichQesAS+BgmPl/sd0NpNj1EoASQ5iS96a/gGA=;
        b=Z2GBuIheyDVyDXeput23V0l/PAlnOo1GwXjU9KN6EMnjaxtOCk52ZmUWUo6kY+WJuJ
         Son+whZgToHjKX7D7hIWjs0mMzA9tu2Ye1Rbxz5elLRd1g/o3uPUr+VyNUe6hb+/QydR
         6AB+SBl8zi5LE8GKdMHcRaYVycxE3EPLjZJvu91Vq8nTyybUY4Oat+SGQTAFJ+AHYvIx
         cBaC4HlG0ZBjYsaDi1HjUABvWj421TCz98z3HJQGIAFMqXhTdvBvWwVQl6nrH7nVZEYO
         VfsRRWe/GE/7ScBNhhSzFM9p0QgzV7JmBPQAjJY/tJbxcTKGtHr3Y3KNVtmq6bk4XvD2
         GAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300431; x=1730905231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rULvNichQesAS+BgmPl/sd0NpNj1EoASQ5iS96a/gGA=;
        b=ji3td4l7aUYyoAECSEGf21AhBjMf5TISnHKpAixsiEAxeI2Jgt+KYpC2EtYLOytApl
         O90G5vhErSTNi1ONDg82snJ2JwMVh9HXapcEcWt+Ssq7UvKMeUy8AD5aLREFhXZ7bsgD
         Elnhnpri40+lrA74GmCyDhe/x3Ids4cjDCCOB6XZH1Tf6JLcgyoZcM6Sv72TxZCvqlBt
         vKHtWp9a98NyBhaIOxpt14VRW8ojOt17hX+My0n0aPgHeyHHJPDaIoqip35ufrWiC4r6
         alM272QMfztfxmD0FgqWDbbn5EYWzH6wrv4vezMA6sIW+FNkMDuXs4zZtZdRev51Ehf0
         iQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIEa3iCAa1edhvtSYhozfZjwoDjMT2oGH05jpVhVpNJ7gf8qu1MQ7lzw7zIUQ16gJ6btIkrt0S@vger.kernel.org, AJvYcCWqqn2WZY3I/kqfhkJlopYE75SXSqAbvIu+668gRQLqy57gdfAz03oFlXBcg3jvbvWAxGJofJGr0giH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4coM5rmOqX2UgFn3AwHZd3P/Mauwe4Fjn/wHmlJdTmlbJQIp5
	IKZVKKhgtvwyVy3s+2komL7AlnX1MUmpOPNZTqzNR8NBUZ3R0McyfnKSGniQq0CbqMcQtJor9tv
	S6RXShJDz74g8p9egxuFNuNqDFs4=
X-Google-Smtp-Source: AGHT+IGQPAOAvrDdaWqZtP3lATUixCSPGWfj+d5lffyZ2v6OC+36VZ5Z0Mp2NekS6Gn1XXBZCpriDdcwWyKIc08XnTQ=
X-Received: by 2002:a05:6102:6c9:b0:497:6bb5:398a with SMTP id
 ada2fe7eead31-4a8cfb5d0c6mr12909664137.7.1730300431163; Wed, 30 Oct 2024
 08:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
In-Reply-To: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 30 Oct 2024 10:00:03 -0500
Message-ID: <CAOCHtYgRD_HTD1F-5+CQ3H1PK3Lbhb-ZdyqDYp3wN2wRK5vOUA@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 12:18=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi all,
>
> During the last few months, booting kernels on BeagleBone Black
> sometimes fails with:
>
>     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
>      davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
> driver SMSC LAN8710/LAN8720
>      soc_device_match(cpsw_soc_devices): no match
>      cpsw-switch 4a100000.switch: initialized cpsw ale version 1.4
>      ...
>      am335x-phy-driver 47401300.usb-phy: dummy supplies not allowed
> for exclusive requests (id=3Dvbus)
>     +cpsw-125mhz-clkctrl:0014:0: failed to disable
>      am335x-phy-driver 47401b00.usb-phy: using DT
> '/ocp/target-module@47400000/usb-phy@1b00' for 'reset' GPIO lookup
>      ...
>      cpsw-switch 4a100000.switch: starting ndev. mode: dual_mac
>     -SMSC LAN8710/LAN8720 4a101000.mdio:00: attached PHY driver
> (mii_bus:phy_addr=3D4a101000.mdio:00, irq=3DPOLL)
>     -cpsw-switch 4a100000.switch eth0: Link is Up - 100Mbps/Full -
> flow control off
>     -Sending DHCP requests ., OK
>     -IP-Config: Complete:
>     -[...]
>     +cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@=
1000/ethernet-phy@0"
> not found on slave 0
>     +[HANG]
>
> Adding debug prints to smsc_phy_probe() makes the issue go away, so it
> must be timing related.
>
> Adding specific debug prints in the failure case gives:
>
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: phy_probe:3613:
> genphy_read_abilities() failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
>
> and later:
>
>     Generic PHY 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     Generic PHY 4a101000.mdio:00: phy_probe:3609:
> genphy_read_abilities failed -EIO
>     cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@=
1000/ethernet-phy@0"
> not found on slave 0

Hey Geert,

What revision of the board do you have, Bx, Cx, etc.

Only C3 has the new PCB with the phy 'reset' gpio line.

https://openbeagle.org/beagleboard/beaglebone-black/-/blob/master/BBB_SCH.p=
df?ref_type=3Dheads

For pre-C3 boards, removing "C24" has fixed a large percentage of my
boards in my ci test farm, while it's not a perfect fix as some still
fail..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/


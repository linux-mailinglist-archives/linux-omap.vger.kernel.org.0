Return-Path: <linux-omap+bounces-2179-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3F973820
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 14:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926D31F2564F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 12:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7416191F73;
	Tue, 10 Sep 2024 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMn0L+UI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F5218F2DB;
	Tue, 10 Sep 2024 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725973082; cv=none; b=GMAkidfOxbR4rSRv66mp4Ip0KSK6Ot3+9CGkVd5NRql7gb0n6vHJo2F9JTWva54hBi4HFaZ6EroQxQN6I+8ZijLoKQ63Nt5OCJRPh6V0ZzEKCvyrvFGJ0g25ucu+KMpkiWZP1lXxuHqrzCFIr4K+rgP1dd3uvLRzu8ixXye3qGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725973082; c=relaxed/simple;
	bh=MsNLxlVpQKT2DOWHrlifclyuixuA5bd8tUg2MRcn+Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvDOdrCo7SmcKKk+8bHkscR9MoMi+6FMdz11kXMRMd3a4tHOdZEe800qdZCiYS5rjmTpFRQtILPO1b/SBMFmHyfg8ECSDIO3uf2xOI8GJHsEViJ0RjK+Sg62RBcYAK8aD0PH6VBRgrnHRxFNlC83WT43cr6Bt6D2KjKqycUrlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMn0L+UI; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-20688fbaeafso55575255ad.0;
        Tue, 10 Sep 2024 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725973080; x=1726577880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUS8mhUC58UDTChTn2sVU5TFkIV/hDV8RxXUMtAqKrM=;
        b=ZMn0L+UI+wcab9svt3FihuAyVzSv/sEb7zSNVcgpsQw3IQWsu8hMBaoBJPEbMrSpKa
         AOwdxGWv8zfm6gcjUzn0+REjlJY4LMSZzZYNcDcMojxRbiNbX9FuCtLr4kUNHG8DizeS
         RX4l1rhVAUpH4qhE4by4M2RTEk/dnF54sStTu34tsYZIlecnrYHBCkfNNwMP4PEj4A9F
         WgUGkcG/ZlsBvvrnygFYjxYECoDn5hvBc8INMwjYU1JnbKDEsBHPxSbzMBGREYSjVYCC
         FyAaNihG69M6250Dc7Xvd0epYOpZt9Rkz802EeUczJtnbZjqEg1kfXEqetTW8JljjbC8
         DygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725973080; x=1726577880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUS8mhUC58UDTChTn2sVU5TFkIV/hDV8RxXUMtAqKrM=;
        b=XdVdAh6TPVxlNQUZIkJZH/yp/vBIE9HbS5Gk6uGhYpAKUZuA7Q4m5yy8Tz0kRy7hYT
         QebcpAZ082x4tpf83gKt9PtzyoM0OfYXSD9rJqhlwBzDheCYMclQETXYyYHie81qo+bn
         rOww2lFWDuZGhZFn60QGCoiMEwvyPRCEuP5OAuyoaVvVSdg673DcGjLLc2btbvqiU/91
         YZw0HZOZOEhsyiW61KknK9iuwVuTR5cdr7WRP1OtJ00e9nlNWigdSeNWbLnCeH4pBBjQ
         nf+nxdIWPebxezKvrSnK4V9LLE79wtc+5red8bRfyXw5zaUaPuTphjaXGANpzqnW6eDJ
         lqDA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Bfk5Zt5EXBYiVHOXbBi8xjYNud6O5VpGnaV9sgofoK+AqZHWxbBUcjy8n1siMi9QvhMHOjlsGmS5ijE=@vger.kernel.org, AJvYcCUnVD+jwy2nAaN38POJmwoVE2cEcz6TKuY0gDG3Na43x8doMZFu4MCIkii8N9BwXRJAlfgTl7Y65VpFP+E=@vger.kernel.org, AJvYcCWhZqvI3XNnPyS1Wl5zWoIRCvY1VBrR6b3U8h+2Tcy/KJq7asx7+t9g4n+XEwuTZ8PX8nI8h6G+lbjAbg==@vger.kernel.org, AJvYcCXdgW0OGmtJ7JYRUODYFfDusoh4oLDB3DdMTFPpP9/ho/TY3wMwRFGUheIUsh0sE6eDnRWhKl39r9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YydaCB8h62bGSPF8B1JVi7+Ghbr/HjrNZyqqAzxJ3SmZn2SDg24
	xPL1dHw8HnDEuJimJxsIUnT48W8b8cn7TiyN6I3q+Jd2lrvJKpdr52hGquQYKDE=
X-Google-Smtp-Source: AGHT+IFGOZoCTNJB6c6BA89kFJoOYl1hzlJ0q3P1FoFkG4+ZNZX+8ts0DZlupnsG6oCf2CltnXPNZQ==
X-Received: by 2002:a17:903:11d0:b0:205:5eaf:99e7 with SMTP id d9443c01a7336-2074c70eaa1mr8420315ad.38.1725973080350;
        Tue, 10 Sep 2024 05:58:00 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e10ee4sm48347315ad.12.2024.09.10.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:57:59 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: conor.dooley@microchip.com
Cc: anup@brainfault.org,
	aou@eecs.berkeley.edu,
	bcm-kernel-feedback-list@broadcom.com,
	chenhuacai@kernel.org,
	coelacanthushex@gmail.com,
	dalias@libc.org,
	florian.fainelli@broadcom.com,
	glaubitz@physik.fu-berlin.de,
	guoren@kernel.org,
	heinrich.schuchardt@canonical.com,
	jonathanh@nvidia.com,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux@armlinux.org.uk,
	loongarch@lists.linux.dev,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	thierry.reding@gmail.com,
	tony@atomide.com,
	ysato@users.sourceforge.jp,
	Celeste Liu <CoelacanthusHex@gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Date: Tue, 10 Sep 2024 20:57:30 +0800
Message-ID: <20240910125729.480594-2-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909-arguable-detection-02445bd1cc89@wendy>
References: <20240909-arguable-detection-02445bd1cc89@wendy>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=CoelacanthusHex@gmail.com; h=from:subject; bh=6nGHo0lCtESeld3ret04gh/vnDvSoID5OBGgjnB5oXg=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ+cLLeU3+q4sXJjayZnHpd9X/KFC6qHNZ0WLPp3p vaYSqSFeVhHKQuDGBeDrJgii9jOp6+XlT76sIzXZAbMHFYmkCEMXJwCMBGpo4wMCzdbR819rrNh F0PLsqgLuV+EkvbEW2QueDjP0ZO7L/PWcUaGJvErL110T2cvKbabdudw3cITiU0XTzhYze07spC xyuEoLwAho0yn
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
Content-Transfer-Encoding: quoted-printable

On 2024-09-09 20:16, Conor Dooley wrote:=0D
> On Mon, Sep 09, 2024 at 08:14:16PM +0800, Celeste Liu wrote:=0D
> > On 2024-09-09 19:53, Conor Dooley wrote:=0D
> > =0D
> > > On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:=0D
> > >> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig=
")=0D
> > >> introduced it because of Docker, but Docker has removed this require=
ment=0D
> > >> since [1] (2023-04-19).=0D
> > >>=0D
> > >> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hie=
rarchy it=0D
> > >> needs an RT budget assigned, otherwise the processes in it will not =
be able to=0D
> > >> get RT at all. The problem with RT group scheduling is that it requi=
res the=0D
> > >> budget assigned but there's no way we could assign a default budget,=
 since the=0D
> > >> values to assign are both upper and lower time limits, are absolute,=
 and need to=0D
> > >> be sum up to < 1 for each individal cgroup. That means we cannot rea=
lly come up=0D
> > >> with values that would work by default in the general case.[2]=0D
> > >>=0D
> > >> For cgroup v2, it's almost unusable as well. If it turned on, the cp=
u controller=0D
> > >> can only be enabled when all RT processes are in the root cgroup. Bu=
t it will=0D
> > >> lose the benefits of cgroup v2 if all RT process were placed in the =
same cgroup.=0D
> > >>=0D
> > >> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also =
doesn't=0D
> > >> support it.[3]=0D
> > >>=0D
> > >> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f22=
08608c1204536=0D
> > >> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700=0D
> > >> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-54=
9164383=0D
> > >>=0D
> > >> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig=
")=0D
> > > =0D
> > > I don't think this fixes tag is suitable, the commit you cite in=0D
> > > moby/docker is a year younger than the one in the fixes tag, so it wa=
s=0D
> > > correct at the time it was written. I think the fixes tag should just=
 be=0D
> > > removed, since that commit was not wrong. Or am I missing something?=
=0D
> > =0D
> > The Docker commit I cited introduce the fix, not the bug. So it should =
be later=0D
> > than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the =
wrong=0D
> > config from upstream.=0D
> > =0D
> > Timeline is:=0D
> > 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]=
=0D
> > 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit=0D
> >               in fixes tag.=0D
> > 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in=0D
> >               commit I cited.=0D
> =0D
> Yes, this is the way I understood things to be. IOW, when Heinrich wrote=
=0D
> ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), it was=0D
> a requirement for docker. The requirement later being removed doesn't=0D
> make his patch incorrect, which is why I don't think this is a fix.=0D
=0D
v3 has been sent.=0D


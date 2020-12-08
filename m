Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061252D35BE
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 23:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbgLHWCG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 17:02:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33550 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729844AbgLHWCB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 17:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607464835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dVwrtMjFPSWA+stVu1eMikGIn2Zj2pVaabSntdZDQrA=;
        b=Mp8fl2lEY/Z7jIarNVAEYckeh5UqoQnZV44ZkGB9jYhYJnT3vkoqh/005aQa3ePoulTO0/
        Jd3hZeph/wg30yRZxEYxXbg1lVX2A2QeTozc5lLksydC9pKH49JWLW7jkxX0KO9geSWm45
        ZJBxCMePjIMSxMpl0Fty4UId1m3OWZ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-fzhYiMGeMCiDK4DwYGI0Vw-1; Tue, 08 Dec 2020 17:00:32 -0500
X-MC-Unique: fzhYiMGeMCiDK4DwYGI0Vw-1
Received: by mail-wm1-f69.google.com with SMTP id k23so1398434wmj.1
        for <linux-omap@vger.kernel.org>; Tue, 08 Dec 2020 14:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=dVwrtMjFPSWA+stVu1eMikGIn2Zj2pVaabSntdZDQrA=;
        b=frdxNnwTeCSea7qn8w1qGV2r+NcaoL4FMvkJpzbXlRcTeKjqgTQudTAdEFbYdXZhR/
         1ZEcEbPu2Pm01iDjps/yJ5emJhJBAT2q7dvSSKZTaqbS4iKjLIXtBq1ajIinp4NTXk59
         nMzggQBQaVlXxDCmiJwfOVWB5yUnsbg9+YIWIx1hny/lKBA+qwzjwwosB5czx4mkTO6J
         I24AXuc7L8BNDd/zqb/vGzJIE7+EVZPPj0TsUKL2HVFqoz9U0ZU9cvUv+Xe1sCp36qk6
         a5MkbMCl5MHlH8F/3nw2HO8k+wdCWLODDp/scBe9MYFSqDxy62cdP8OgmkghF1/UgVg0
         JRRw==
X-Gm-Message-State: AOAM530RWcFsllscA73aWXmsmdOZDRO2OUEXCGN0Solh9FGIAPm13gDc
        1pGRmYdktiGhJy70V/2X5b/TokIz6ekBsRQF4MicZCpaEyw0RSty0/Bc76oDxPc7N2sjRAbuYP1
        I1DwudjZwKkKEzEorcB+n+Q==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr151724wrm.260.1607464828386;
        Tue, 08 Dec 2020 14:00:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSwb4gu0VPC90w4U16G8hnN/hXWQFO+jMf3AOb+Pqpbep24Nod9ZchBqlSFxLbqmT4jM5D/g==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr151688wrm.260.1607464828144;
        Tue, 08 Dec 2020 14:00:28 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 35sm315438wro.71.2020.12.08.14.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 14:00:27 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 22007180002; Tue,  8 Dec 2020 23:00:27 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andriin@fb.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Simon Horman <simon.horman@netronome.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jiri Benc <jbenc@redhat.com>, oss-drivers@netronome.com,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2 0/7] selftests/bpf: Restore test_offload.py to
 working order
In-Reply-To: <20201208090315.5106c049@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
References: <160708272217.192754.14019805999368221369.stgit@toke.dk>
 <87360gidoo.fsf@toke.dk>
 <20201208090315.5106c049@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 08 Dec 2020 23:00:27 +0100
Message-ID: <87r1o0ot50.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Tue, 08 Dec 2020 15:18:31 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> writes:
>>=20
>> > This series restores the test_offload.py selftest to working order. It=
 seems a
>> > number of subtle behavioural changes have crept into various subsystem=
s which
>> > broke test_offload.py in a number of ways. Most of these are fairly be=
nign
>> > changes where small adjustments to the test script seems to be the bes=
t fix, but
>> > one is an actual kernel bug that I've observed in the wild caused by a=
 bad
>> > interaction between xdp_attachment_flags_ok() and the rework of XDP pr=
ogram
>> > handling in the core netdev code.
>> >
>> > Patch 1 fixes the bug by removing xdp_attachment_flags_ok(), and the r=
eminder of
>> > the patches are adjustments to test_offload.py, including a new featur=
e for
>> > netdevsim to force a BPF verification fail. Please see the individual =
patches
>> > for details.
>> >
>> > Changelog:
>> >
>> > v2:
>> > - Replace xdp_attachment_flags_ok() with a check in dev_xdp_attach()
>> > - Better packing of struct nsim_dev=20=20
>>=20
>> Any feedback on v2? Would be great to get it merged before the final
>> 5.10 release :)
>
> LGTM but if my opinion mattered this could would not have been changed
> in the first place :)

Heh, right. Well I, for one, value your input, so thanks for taking a
look :)

-Toke


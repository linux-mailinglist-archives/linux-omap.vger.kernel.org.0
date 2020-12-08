Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567AF2D2CFB
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 15:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbgLHOUE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 09:20:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22036 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgLHOUE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 09:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607437117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kyi764q7bLFJWD1wlZnYqTKpOBWuYBmNWhVFNKin/4U=;
        b=EKyLNYWIYirdH5g6RSng8JfZ03W/2ecDeU0VwJxdvoe7n34QH+56MsfEJy7XnEZ/tDI2eH
        o6WhhRpehkhDy6AAf6DOGijFmIGvAMcfuWZOyXpawd/6CfUbQTNb16sgM+nSheuWhwK2ux
        6TjwPRW7yZWcIadyd9RCy8ZnUNQh5Mk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-jv-bDYx2Pp-bVQReR_s5TA-1; Tue, 08 Dec 2020 09:18:33 -0500
X-MC-Unique: jv-bDYx2Pp-bVQReR_s5TA-1
Received: by mail-wm1-f71.google.com with SMTP id f12so933878wmf.6
        for <linux-omap@vger.kernel.org>; Tue, 08 Dec 2020 06:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=kyi764q7bLFJWD1wlZnYqTKpOBWuYBmNWhVFNKin/4U=;
        b=dymdcqI6EiW4OKkB6aHXmRdui3UEGJBSDYCI6FrKOZzBbtYyOf7LLH1DHSJ+eiphya
         HUiHgFJd/rtqxzFG/+pOki/uwX9vPGwiUD0KHbhTg2nETqvbOMl1g9Ze4tSRrOa5CDdb
         zO8Uy7JaxZBVIYG2MmXRuVjuN2dXQwzoUTkyknay3MIDvJ/RcIyGHT2oSVrZxMJamr+X
         gzXEWwZK33/HnMm+kPzZ4MQ42ZTeM6bKrdUaHgXflYMFlIeTqFvIHORDRfE/D8T7s1CW
         Jp7K9VYe1L4HQ8lKfsIx6Y9u7sCx3v78Nc4BuTegGiYOlwLl5QsVI1joX8Oxx/PXOXgD
         Y0/w==
X-Gm-Message-State: AOAM531pkySE6nTAlvpQuYqQkDJiPaIQkNXxF/H1eWjUSkszkbjK41m9
        tquo1tFdK63oVTHu+PaGUNXfDjS5dCDeeTMlRRx4vrozHWgHEcIHHr7T+I5Sb58c18ZVWthBg8u
        80AG+4qMlQ6hcteqmmB2lNQ==
X-Received: by 2002:adf:e452:: with SMTP id t18mr3054wrm.177.1607437112734;
        Tue, 08 Dec 2020 06:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgsLAqTl5hPrd0rf4yZywxhz1s4wTSYc9P/VHbfPy4D+vCv+PxkIwhST2xifkqo5IB69SJvg==
X-Received: by 2002:adf:e452:: with SMTP id t18mr3028wrm.177.1607437112519;
        Tue, 08 Dec 2020 06:18:32 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id d8sm20756925wrp.44.2020.12.08.06.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:18:31 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 7EDAB18060F; Tue,  8 Dec 2020 15:18:31 +0100 (CET)
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
In-Reply-To: <160708272217.192754.14019805999368221369.stgit@toke.dk>
References: <160708272217.192754.14019805999368221369.stgit@toke.dk>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 08 Dec 2020 15:18:31 +0100
Message-ID: <87360gidoo.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> writes:

> This series restores the test_offload.py selftest to working order. It se=
ems a
> number of subtle behavioural changes have crept into various subsystems w=
hich
> broke test_offload.py in a number of ways. Most of these are fairly benign
> changes where small adjustments to the test script seems to be the best f=
ix, but
> one is an actual kernel bug that I've observed in the wild caused by a bad
> interaction between xdp_attachment_flags_ok() and the rework of XDP progr=
am
> handling in the core netdev code.
>
> Patch 1 fixes the bug by removing xdp_attachment_flags_ok(), and the remi=
nder of
> the patches are adjustments to test_offload.py, including a new feature f=
or
> netdevsim to force a BPF verification fail. Please see the individual pat=
ches
> for details.
>
> Changelog:
>
> v2:
> - Replace xdp_attachment_flags_ok() with a check in dev_xdp_attach()
> - Better packing of struct nsim_dev

Hi Jakub

Any feedback on v2? Would be great to get it merged before the final
5.10 release :)

-Toke


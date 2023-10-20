Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFD97D16BC
	for <lists+linux-omap@lfdr.de>; Fri, 20 Oct 2023 22:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjJTUEQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Oct 2023 16:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjJTUEQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Oct 2023 16:04:16 -0400
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7411ED53
        for <linux-omap@vger.kernel.org>; Fri, 20 Oct 2023 13:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697832243; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gRbFKtdFSeKMAtv1IUbs8Q22makzCtIdluM1mGew6qXSmdEMGbN46qmML+igYr0Ugb
    BQQPgTqfE9hX8qQY3nTYstWu2k32EK+0tdXsXLD4TiQzJPZJRnoxCS8lVZJvOh5XhqJb
    gMScsGulci2fgmTDS8Lzff6h7RM+LDGByZwwflPPNF/iCPW09SaCT9+u5L02csgaZuWP
    hnrdOVeoz9cWtPbKY3sMPgkV+0tU867MZ/9USS2VbxpXD8rS+k2Wc1Hc8ErQwh1U3Vmi
    C7I254T3q9qhFN2+daWSHkPPPGUo7yY1GOLrdSCCjDCTWwD6eHm5w1MruHPAuOM8Dd4M
    xRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1697832243;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jWuNz2CADT+2TjuJI+jElyd+pq94+me2mcG/Q05gJ7I=;
    b=sTNFj+KFmsVD/bPqIPO36Gb1TSOUKr8AZ5HEYJ39dCo9icPAPG+QKm/SXojheSyWLP
    upvV3yo/UPH3cfw+mOinUpcBQyVYhlSqm4M+VHxU+2JgVqjHS7AYv2fiynct7MeW3F0X
    v2ddcanm7g2BZkSC3myvBLGZRRmBq78wf7QNgmAyYuxg+sQyJ5LucAHbi0bevvTmx4Gw
    p9x+eBACdWNhHtE1FKPJgqK1wI1m2OiaZfjlNqTv0MC1qc2tv7j90VOkE7l41ff4RJ6k
    abMjGuPO99htoUgMT6zS1LTGvQ8Lttl3Aa8fLHs+utFIMzrlUCJbDtFsoimjxcbZPtDX
    aNYA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1697832243;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jWuNz2CADT+2TjuJI+jElyd+pq94+me2mcG/Q05gJ7I=;
    b=K3xLIwUsJGjIzzqAPvE8A1KlB1TXZykpFGnJyMA/dRRiKHg9Mr/ORWXS92Ab40xoiH
    slXW+Ua9wvXvBs9JkjzWh9gbtOQAnVnam1AHZbWblg6ZHPQb875MQTgnIxlo8udz013L
    eMNO3YQKhpLdotnqP1QzORXJ3rZFRB3SdWzD3/Iaw5OZSRqWhLQ7E1+y0wag95XwAoUL
    CF+wmrw4Q6uoYr82I6dIT5zvMeMuQp9lyhDyjU+cDXXTOKMfjHkfpFBFoNUJCqcWe03z
    z6QThs0pSu9u+xBM32EsAaJJBB6XZjc93XgescqfZzLIgX9EcxK3RgUeksiiRtBE47q0
    m5WQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1697832243;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jWuNz2CADT+2TjuJI+jElyd+pq94+me2mcG/Q05gJ7I=;
    b=z8Iw+BYgtls/pg5+VdKTveYCCquCVQZjVSWtKT5dAfkvGZ8x0IuGZOkIGrIfp+JiRo
    x8RcS+hV17t7XG2+uRAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZijY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.9.0 DYNA|AUTH)
    with ESMTPSA id 62efcaz9KK43J3p
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Fri, 20 Oct 2023 22:04:03 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: TI git rep for omap5-sgx-ddk-um-linux.git not available
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20231020200503.1ed2cef6@aktux>
Date:   Fri, 20 Oct 2023 22:04:02 +0200
Cc:     openpvrsgx-devgroup@letux.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B48F3B71-810D-44C7-A7E7-0C501A5F3B41@goldelico.com>
References: <2014DE2B-59DD-453F-9D89-682F6AA261D8@goldelico.com>
 <20231020200503.1ed2cef6@aktux>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Andreas,

> Am 20.10.2023 um 20:05 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> Hi,
>=20
> On Fri, 20 Oct 2023 19:09:17 +0200
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>> Hello,
>>=20
>> I am experiencing problems trying to git clone or remote update
>>=20
>> 	https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
>>=20
>> 	Error: RPC failed; HTTP 403 curl 22 The requested URL returned =
error: 403
>>=20
> andi@aktux:~/epson$ git clone =
https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
> Cloning into 'omap5-sgx-ddk-um-linux'...
> remote: Enumerating objects: 3010, done.
> remote: Counting objects: 100% (489/489), done.
> remote: Compressing objects: 100% (310/310), done.
> remote: Total 3010 (delta 244), reused 305 (delta 132), pack-reused =
2521
> Receiving objects: 100% (3010/3010), 157.51 MiB | 5.13 MiB/s, done.
> Resolving deltas: 100% (1926/1926), done.
>=20
> seems to work here.

Thanks for testing!

Well, I was under the assumption that a fresh git clone would also not =
work.

It is strange. I can git clone. And then I can git remote update.
But I can't git remote update the existing repositiory.

Both have the same fetch/push paths:

iMac:master hns$ (cd /tmp/omap5-sgx-ddk-um-linux/; git remote -v)
origin	https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git =
(fetch)
origin	https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git =
(push)
iMac:master hns$ git remote -v | fgrep ti-sgx544-um
iMac:master hns$=20
ti-sgx544-um	=
https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git (fetch)
ti-sgx544-um	=
https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git (push)
iMac:master hns$
iMac:master hns$ LANG=3DC git remote -v update ti-sgx544-um
Fetching ti-sgx544-um
POST git-upload-pack (155 bytes)
POST git-upload-pack (gzip 2510 to 1184 bytes)
POST git-upload-pack (gzip 3310 to 1590 bytes)
POST git-upload-pack (gzip 4910 to 2399 bytes)
POST git-upload-pack (gzip 8110 to 3987 bytes)
POST git-upload-pack (gzip 14510 to 7223 bytes)
POST git-upload-pack (gzip 27310 to 13649 bytes)
POST git-upload-pack (gzip 52910 to 26557 bytes)
POST git-upload-pack (gzip 104110 to 51889 bytes)
POST git-upload-pack (gzip 206510 to 102496 bytes)
POST git-upload-pack (gzip 411310 to 203766 bytes)
POST git-upload-pack (gzip 820910 to 406391 bytes)
POST git-upload-pack (gzip 902810 to 446829 bytes)
POST git-upload-pack (chunked)
error: RPC failed; HTTP 403 curl 22 The requested URL returned error: =
403
fatal: expected 'acknowledgments'
error: could not fetch ti-sgx544-um
iMac:master hns$=20

So what is different with the repositories? One is empty while the other =
one already contains the Linux tree and more.

Therefore it seems to be that the local git index makes git (v2.42) send =
a request the server can't answer?

So I'll try to force git remote update fetch a fresh index (if that can =
be done).
Or look if I find how the local .git repo is broken.

BR and thanks,
Nikolaus=

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 315A57D1C05
	for <lists+linux-omap@lfdr.de>; Sat, 21 Oct 2023 11:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjJUJXQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 21 Oct 2023 05:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjJUJXP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 21 Oct 2023 05:23:15 -0400
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6966F13E
        for <linux-omap@vger.kernel.org>; Sat, 21 Oct 2023 02:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697880186; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=D95X8yro+Ai23rWZUBEN6h2y8pu9NPjwefC2hvlTL2GmCK0OjydhZe1Z5gg+d4HugN
    VmIQRLnsZOxmDzmf822j0VEocvfkWhIH928TimxTFkr4WwP5ZFn7yVBJqBmHg888YaMK
    sUFenXzg2FfJ1CqCLe65TUwIOp/JJRhx8B9Rs1MoK8nKh/KAXojiVAsM8aaZ6tbAvNMJ
    NQyFHmHPauSspxqOXHMSbyB+91C7te/MIj42MmgMl/19naEVgf+4m0dQBalbhYp1S5+w
    I3ZnA0R3DJJAsLi4AIJE7F+zhyLjooFuI1S5nh3aqd+JGVAiCeSNFBDFrrdvrVcRr1U4
    WHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1697880186;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8sKcMXdZSMLBZOqr3WhNBVP+eXHYg+eVxSyXluTHgas=;
    b=awPHTBeAit1wJaAdOWkXSFkKKV5djzIiepxNOe42QIc1FiicEGarFy/+uDLwMFIHLI
    iqVvOu/HGmSLhOlMFnmpzJLipSNG5AQMXGyd8TN/cmpoFQkmtWP74u1oE9RN/OQQf3WS
    96onjVqhVvAcvJRrePn1CeRVUrslopqPdusG5re5bQWsqs5ncLAHWjQVzcyiobZCG5hN
    R6MRwkuEIT4VZSGI76hpjKEw7CjcOD+lsHft8W/rE7ufDEqxvSi2QZep49RHfdApnljt
    RawuapOfaZc/bQ6BDHs4ggF7xc+szyIaKRaO5EOAo6lNvTVuqbsaEppEdx3DvH9t1TGA
    YpvA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1697880186;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8sKcMXdZSMLBZOqr3WhNBVP+eXHYg+eVxSyXluTHgas=;
    b=CZDkr2dt5yXECjJK1JazsLO5IwqdOb0JyvFWatO6bKRa/ml3Pwy6kFpKjbXfuR5vZb
    TeNFmB1/yKtU2XMlgn7uqCC43ic1MmKi0Q+VvnY3UzfwAL+Rt5KlkLOX8g5jJXxvwmKJ
    KbtN9a73mmcKqH4ob8n/L54lN5Hwn/t6gG5cBwBjrLRW3aniIGXw+olMf6UTSQyV7Hu+
    dU9jQ78luCQyjskWZevSGtMFN+xRFTOtiTGVcv2ndQRnOhzkCnf81cjp9aQY7f5JXJ8s
    1wCrDtyiZm3mUgm3Do/9YKvCmlSMMNDx91YyKcrIGacytWcA1hWAqme6BLRHIDgZ5J5z
    6Ovw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1697880186;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8sKcMXdZSMLBZOqr3WhNBVP+eXHYg+eVxSyXluTHgas=;
    b=0KFixZYJF2oOl2i3P2CP2//Eqw5RhBhis9q7QOZhxhldMO5LLoJkAAdighLc6DYeaW
    hkG5EB0jfHSSQFur1TAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZjzY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.9.0 DYNA|AUTH)
    with ESMTPSA id 62efcaz9L9N5Jdl
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Sat, 21 Oct 2023 11:23:05 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: [Openpvrsgx-devgroup] TI git rep for omap5-sgx-ddk-um-linux.git
 not available
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <B48F3B71-810D-44C7-A7E7-0C501A5F3B41@goldelico.com>
Date:   Sat, 21 Oct 2023 11:23:05 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        letux-kernel@openphoenux.org, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D2D5C38-C23A-4871-AB9C-7A64E7189CD8@goldelico.com>
References: <2014DE2B-59DD-453F-9D89-682F6AA261D8@goldelico.com>
 <20231020200503.1ed2cef6@aktux>
 <B48F3B71-810D-44C7-A7E7-0C501A5F3B41@goldelico.com>
To:     OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>
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

Hi all,

> Am 20.10.2023 um 22:04 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Andreas,
>=20
>> Am 20.10.2023 um 20:05 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>=20
>> Hi,
>>=20
>> On Fri, 20 Oct 2023 19:09:17 +0200
>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>=20
>>> Hello,
>>>=20
>>> I am experiencing problems trying to git clone or remote update
>>>=20
>>> 	https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
>>>=20
>>> 	Error: RPC failed; HTTP 403 curl 22 The requested URL returned =
error: 403
>>>=20
> Both have the same fetch/push paths:
>=20
> iMac:master hns$ (cd /tmp/omap5-sgx-ddk-um-linux/; git remote -v)
> origin	=
https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git (fetch)
> origin	=
https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git (push)
> iMac:master hns$ git remote -v | fgrep ti-sgx544-um
> iMac:master hns$=20
> ti-sgx544-um	=
https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git (fetch)
> ti-sgx544-um	=
https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git (push)
> iMac:master hns$
> iMac:master hns$ LANG=3DC git remote -v update ti-sgx544-um
> Fetching ti-sgx544-um
> POST git-upload-pack (155 bytes)
> POST git-upload-pack (gzip 2510 to 1184 bytes)
> POST git-upload-pack (gzip 3310 to 1590 bytes)
> POST git-upload-pack (gzip 4910 to 2399 bytes)
> POST git-upload-pack (gzip 8110 to 3987 bytes)
> POST git-upload-pack (gzip 14510 to 7223 bytes)
> POST git-upload-pack (gzip 27310 to 13649 bytes)
> POST git-upload-pack (gzip 52910 to 26557 bytes)
> POST git-upload-pack (gzip 104110 to 51889 bytes)
> POST git-upload-pack (gzip 206510 to 102496 bytes)
> POST git-upload-pack (gzip 411310 to 203766 bytes)
> POST git-upload-pack (gzip 820910 to 406391 bytes)
> POST git-upload-pack (gzip 902810 to 446829 bytes)
> POST git-upload-pack (chunked)
> error: RPC failed; HTTP 403 curl 22 The requested URL returned error: =
403
> fatal: expected 'acknowledgments'
> error: could not fetch ti-sgx544-um
> iMac:master hns$=20
>=20
> So what is different with the repositories? One is empty while the =
other one already contains the Linux tree and more.

The difference seems to be that the git client uploads a packed list of =
what it already
knows and that may be too big for the git server. On a fresh clone there =
is no such list
and nothing to upload on a git remote update directly after doing the =
clone.

Finally I found a solution: =
https://lqy.me/t/debugging-experience-code-references/14

Add this to ~/.gitconfig:

[http]
	postBuffer =3D 157286400

(it also works to add to $REPO/.git/config)

BR,
Nikolaus


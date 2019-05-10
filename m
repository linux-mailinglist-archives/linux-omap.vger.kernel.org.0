Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C6819A36
	for <lists+linux-omap@lfdr.de>; Fri, 10 May 2019 11:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfEJJEV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 May 2019 05:04:21 -0400
Received: from mail3.bemta25.messagelabs.com ([195.245.230.146]:1973 "EHLO
        mail3.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726992AbfEJJEV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 May 2019 05:04:21 -0400
Received: from [46.226.53.53] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-c.eu-west-1.aws.symcld.net id 1C/B3-23848-F8E35DC5; Fri, 10 May 2019 09:04:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRWlGSWpSXmKPExsViZ8MxVbfP7mq
  Mwd2duhazl/SzODB6fN4kF8AYxZqZl5RfkcCasfv3cdaCXf4V11/+ZWpgXOfRxcjFISSwjEli
  wq5lLBDOMUaJG5P/AzmcQM5FRonbe2JAbDYBd4mt9+4zgdgiArYS364cY+5i5OAQFvCU2DUvD
  SLsJ7GifQ4LhK0nse9hByuIzSKgKrF8whJGEJtXwFvi6pMuNhCbUUBFYtfdLWBxZgFxiVtP5o
  ONlxAQkXh48TQbhC0q8fLxP7A5ogLyEk8v3GWHiOtInL3+hBHCNpDYunQfC4StIHF173YWiJl
  VEidPtbNB7BWUODnzCcsERpFZSNbNQlI2C0kZRFxTonX7b3YIW1ti2cLXzBC2rcT+qyuhbFOJ
  10c/MkLYihJTuh+yL2DkWMVokVSUmZ5RkpuYmaNraGCga2hopGtkAMIGeolVusl6qaW65anFJ
  bqGeonlxXrFlbnJOSl6eaklmxiBUZlScOrEDsY5K9IPMUpyMCmJ8raoXY0R4kvKT6nMSCzOiC
  8qzUktPsQow8GhJMHrZQuUEyxKTU+tSMvMAaYHmLQEB4+SCK8GSJq3uCAxtzgzHSJ1itGe48C
  ih3OZOQ5+B5FHJj4DkvcOPp/LLMSSl5+XKiXO+8AGqE0ApC2jNA9uKCydXWKUlRLmZWRgYBDi
  KUgtys0sQZV/xSjOwagkzHsCZApPZl4J3O5XQGcxAZ0lVHcJ5KySRISUVAOj9e+I7UVZ/RdmS
  MdX2+zfNOXzkdN1Ha7Fgs9qF3Caf5Z+O7+17uzRJ3vUPN0inrnHHJm8OmWmhPhJ4fp7gTevPx
  S/VMl14JSX9oMFSm/j1xn0tG5fJPl0TV7uNxnByXtLBSUqvnPLb8kMj/mnxDK5buO/K/x34/w
  jd87nnXUgVsD6R6NoVt8EJZbijERDLeai4kQAsws7jGIDAAA=
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-20.tower-305.messagelabs.com!1557479054!5880564!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27049 invoked from network); 10 May 2019 09:04:14 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-20.tower-305.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 May 2019 09:04:14 -0000
Received: from R01UKEXCASM124.r01.fujitsu.local (ex2k13_124.fs.fujitsu.com [10.183.43.176])
        by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id x4A94AZD020763
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
        for <linux-omap@vger.kernel.org>; Fri, 10 May 2019 10:04:14 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
 R01UKEXCASM124.r01.fujitsu.local (10.183.43.176) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 10 May 2019 10:04:10 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
 by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22]) with
 mapi id 15.00.1395.000; Fri, 10 May 2019 10:04:09 +0100
From:   "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Kernel Oops when something is executed from within the initramfs
Thread-Topic: Kernel Oops when something is executed from within the initramfs
Thread-Index: AQHVBw9UinRRwm1BC0G6WBfKA16jQw==
Date:   Fri, 10 May 2019 09:04:09 +0000
Message-ID: <50042d920efa281582ed8b5486ea89456ad4de65.camel@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.1-2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.93]
Content-Type: multipart/signed; micalg=sha-1;
        protocol="application/x-pkcs7-signature"; boundary="=-gfjdRP/teSEqZnTdRmql"
MIME-Version: 1.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=-gfjdRP/teSEqZnTdRmql
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all!

I try to update our kernel of our AM335x based board to a newer version (4.=
4.179).
The new kernel builds and boots, but as soon as something from within the i=
nitramfs is executed,
a kernel Oops occurs, e.g. modprobe (davinci_mdio requests a module) and /i=
nit can't be executed.

The problem is, that I've no clue what's going wrong.

Here is the kernel Oops of the modprobe:
[    1.155713] Internal error: Oops - undefined instruction: 0 [#1] SMP THU=
MB2
[    1.163027] Modules linked in:
[    1.166238] CPU: 0 PID: 107 Comm: modprobe Not tainted 4.4.179 #6
[    1.172625] Hardware name: Generic AM33XX (Flattened Device Tree)
[    1.179016] task: dc4386c0 ti: dc6f2000 task.ti: dc6f2000
[    1.184690] PC is at ret_fast_syscall+0x2/0x54
[    1.189356] LR is at SyS_brk+0xa7/0xf0
[    1.193287] pc : [<c000d362>]    lr : [<c00a3c37>]    psr: 60000013
[    1.193287] sp : dc6f3fa8  ip : 50c5387d  fp : 00001000
[    1.205327] r10: 00000000  r9 : dc6f2000  r8 : c000d544
[    1.210804] r7 : 0000002d  r6 : b6f470c0  r5 : 00010034  r4 : 00000008
[    1.217648] r3 : 000a39bd  r2 : ffff0001  r1 : 00000000  r0 : 000a6000
[    1.224495] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[    1.231977] Control: 50c5387d  Table: 9c6f4019  DAC: 00000051
[    1.238001] Process modprobe (pid: 107, stack limit =3D 0xdc6f2218)
[    1.244391] Stack: (0xdc6f3fa8 to 0xdc6f4000)
[    1.248961] 3fa0:                   00000008 00010034 00000000 00000001 =
00000000 b6f75f38
[    1.257541] 3fc0: 00000008 00010034 b6f470c0 0000002d 00000000 00000001 =
00000001 00001000
[    1.266121] 3fe0: 00000001 bee68ddc b6f5d90c b6f5e748 20000010 00000000 =
00000000 00000000
[    1.274708] Code: 00000000 00000000 00000000 b6720000 (1000f8d9)=20
[    1.281108] ---[ end trace dba2297921799880 ]---

And here the Oops of /init:
[    2.288500] Internal error: Oops - undefined instruction: 0 [#2] SMP THU=
MB2
[    2.295812] Modules linked in:
[    2.299023] CPU: 0 PID: 1 Comm: init Tainted: G      D         4.4.179 #=
6
[    2.306139] Hardware name: Generic AM33XX (Flattened Device Tree)
[    2.312531] task: df047940 ti: df048000 task.ti: df048000
[    2.318205] PC is at ret_fast_syscall+0x2/0x54
[    2.322870] LR is at SyS_brk+0xa7/0xf0
[    2.326801] pc : [<c000d362>]    lr : [<c00a3c37>]    psr: 60000013
[    2.326801] sp : df049fa8  ip : 50c5387d  fp : 00001000
[    2.338840] r10: 00000000  r9 : df048000  r8 : c000d544
[    2.344318] r7 : 0000002d  r6 : b6f220c0  r5 : 00010034  r4 : 00000008
[    2.351162] r3 : 000e8988  r2 : ffff0001  r1 : 00000000  r0 : 000ee000
[    2.358008] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[    2.365489] Control: 50c5387d  Table: 9c7c4019  DAC: 00000051
[    2.371512] Process init (pid: 1, stack limit =3D 0xdf048218)
[    2.377354] Stack: (0xdf049fa8 to 0xdf04a000)
[    2.381924] 9fa0:                   00000008 00010034 00000000 00000001 =
00000000 b6f50f38
[    2.390505] 9fc0: 00000008 00010034 b6f220c0 0000002d 00000000 00000001 =
00000001 00001000
[    2.399085] 9fe0: 00000001 bece9e2c b6f3890c b6f39748 20000010 00000000 =
00000000 00000000
[    2.407671] Code: 00000000 00000000 00000000 b6720000 (1000f8d9)=20
[    2.414063] ---[ end trace dba2297921799882 ]---
[    2.419912] Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x0000000b
[    2.419912]=20
[    2.429507] ---[ end Kernel panic - not syncing: Attempted to kill init!=
 exitcode=3D0x0000000b

As you can see, the Oops are more or less identically.
The PC address 0xc000d362 translates to arch/arm/kernel/entry-common.S:38 [=
0] and LR 0xc00a3c37 to mm/mmap.c:355 [1]

Can someone give me an hint where I can start to look for the problem, plea=
se?

Cheers,
Thilo

[0] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/a=
rch/arm/kernel/entry-common.S?h=3Dv4.4.179#n38
[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/m=
m/mmap.c?h=3Dv4.4.179#n355

--=-gfjdRP/teSEqZnTdRmql
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIO4TCCBNcw
ggO/oAMCAQICCiSNEwIAAQACcUMwDQYJKoZIhvcNAQEFBQAwLzEtMCsGA1UEAxMkRnVqaXRzdSBU
ZWNobm9sb2d5IFNvbHV0aW9ucyBVc2VyIENBMB4XDTE5MDMxMTE1NTA0NFoXDTIyMDMxMDE1NTA0
NFowQjEZMBcGA1UEAwwQQ2VzdG9uYXJvLCBUaGlsbzElMCMGA1UECgwcRnVqaXRzdSBUZWNobm9s
b2d5IFNvbHV0aW9uczCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxBawqv3l1UYzPh200CPw
+C4Lmr9INkgOXxSSb9jckQIydjq1EI0hDTtuCGrnegSQUE/UyH1tF68Rg8k5jFN3WGP3Nq3FYccI
Vithm3lVhmrJwmRYmHsApNDzbO397qosCadiCqbLEnqTo9E6iNKhWXlwL4vx6ic57PLvZqjEjsMC
AwEAAaOCAmQwggJgMAsGA1UdDwQEAwIFoDCBvgYDVR0RBIG2MIGzgR50aGlsby5jZXN0b25hcm9A
dHMuZnVqaXRzdS5jb22BI1RoaWxvLkNlc3RvbmFyb0BmdWppdHN1LXNpZW1lbnMuY29tgR50aGls
by5jZXN0b25hcm9AY2VtYWlsLmZzYy5uZXSBKHRoaWxvLmNlc3RvbmFyb0BlbWVpYWNlbWVhLmZ1
aml0c3UubG9jYWyBIis0OTgyMTgwNDgyMzI4QGluY29taW5nZmF4LmZzYy5uZXQwHQYDVR0OBBYE
FG82zUiLm89hH0nCcAY02RuS+4YNMB8GA1UdIwQYMBaAFEGdEN1Eu4l2olKE8qRXJC3ePoHzMD8G
A1UdHwQ4MDYwNKAyoDCGLmh0dHA6Ly9jZHAudHMuZnVqaXRzdS5jb20vY2RwL2Z0czAxdXNlcigx
KS5jcmwwSgYIKwYBBQUHAQEEPjA8MDoGCCsGAQUFBzAChi5odHRwOi8vYWlhLnRzLmZ1aml0c3Uu
Y29tL2FpYS9mdHMwMXVzZXIoMSkuY2VyMAwGA1UdEwEB/wQCMAAwPQYJKwYBBAGCNxUHBDAwLgYm
KwYBBAGCNxUIhYXEMoGH/2GBhYEEhuyCIIHHgRp5g4igcYfS8S8CAWQCAQgwEwYDVR0lBAwwCgYI
KwYBBQUHAwQwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDBEBgkqhkiG9w0BCQ8ENzA1MA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcwCgYIKoZIhvcNAwcwDQYJKoZI
hvcNAQEFBQADggEBALKreuSS9+wfZ0H6ozKl2itg44C8UqbqOkPLuxDtIPTgolN8eba85vNGtsIE
yY7pUmZMwnxSXrqBCSxrHPGrnMiuJyC2/cZdq6JibG5qlDD70P2aMJdxxK7YjuMV9cC9j+ugX+QP
L1WM9k3j6S+EG4xRRcVO/9GgCv2C7rmHRLZg4UUq8JcCiRcbztK5Bi4nWKomVumrHxiLhyL9UUgF
/5irHdJPnDZykdI9qJPmCf4nw3415TjQxdBMt5RkRfw6d/Z0eyE5KrkgPoJOVcbW38FBREU6F0KP
p36JbC6//v24aBxk2b4Rywp1bOhNhw158Epsjt3HU4oYAF8duTf52+EwggTXMIIDv6ADAgECAgok
jRMCAAEAAnFDMA0GCSqGSIb3DQEBBQUAMC8xLTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9neSBT
b2x1dGlvbnMgVXNlciBDQTAeFw0xOTAzMTExNTUwNDRaFw0yMjAzMTAxNTUwNDRaMEIxGTAXBgNV
BAMMEENlc3RvbmFybywgVGhpbG8xJTAjBgNVBAoMHEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlv
bnMwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMQWsKr95dVGMz4dtNAj8PguC5q/SDZIDl8U
km/Y3JECMnY6tRCNIQ07bghq53oEkFBP1Mh9bRevEYPJOYxTd1hj9zatxWHHCFYrYZt5VYZqycJk
WJh7AKTQ82zt/e6qLAmnYgqmyxJ6k6PROojSoVl5cC+L8eonOezy72aoxI7DAgMBAAGjggJkMIIC
YDALBgNVHQ8EBAMCBaAwgb4GA1UdEQSBtjCBs4EedGhpbG8uY2VzdG9uYXJvQHRzLmZ1aml0c3Uu
Y29tgSNUaGlsby5DZXN0b25hcm9AZnVqaXRzdS1zaWVtZW5zLmNvbYEedGhpbG8uY2VzdG9uYXJv
QGNlbWFpbC5mc2MubmV0gSh0aGlsby5jZXN0b25hcm9AZW1laWFjZW1lYS5mdWppdHN1LmxvY2Fs
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
fWnFSEouJIOqv+bZTc8AAAAAAAA=


--=-gfjdRP/teSEqZnTdRmql--
